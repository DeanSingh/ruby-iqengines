# IQ Engines API Bindings for Ruby #

### Dependencies ###

- **rake**
- **ruby-hmac (version 0.4.0 or greater)** 
- **rest-client (version  1.6.1 or great)**

### Install ###

You can install the module by running the commands below.

    git clone git://github.com/iqengines/ruby-iqengines.git
    cd ruby-iqengines
    rake install


# Example Usage #
    
    require 'iqengines'
    api = IQEngines.Api(<YOUR_KEY>, <YOUR_SECRET>)
    
    # sends a query to IQ Engines
    qid, response = api.send_query('./test/a.jpeg')
    
    # waits for results using a long-polling connection
    response = api.wait_results()
    puts response
    
# Api Reference #

<br>
### IQEngines.Api(key, secret) ###

A constructor that returns a handle to the iqengines API. `key` and `secret` is your API key/secret obtained from signing up for an account at [http://developer.iqengines.com/][3]. If these are left undefined, the module will look up their values from the `IQE_KEY` and `IQE_SECRET` from the shell environment.

<br>
<br>
### Api.send\_query(img, extra=nil, webhook=nil, device\_id=nil, multiple\_results=nil, modules=nil, json=true)###

Sends an image query to the iqengines servers. Returns [`qid`, `response`] where *qid* represents the unique identifier for the given query and *response* is the response from the IQ Engines server.

- img - The file path to your image (jpg, png)
- multiple_results - If true then all identified images are returned in the results
- device_id - A unique string used to filter out the results when retrieving results using the waitResult method
- webhook - The URL where the results are sent via HTTP POST once the results have been computed
- extra - A string that is posted back when the webhook is called or when retreiving results. It is useful for passing JSON-encoded extra parameters about the query that your application can then use once the results are available
- json - If true, then the response is formatted as a JSON object
    

<br>
<br>
### Api.get_result(qid, json=true) ###

Returns the result for a given query. The response here will either contain the results of the query if it has been processed or a message specifying that query has not been processed yet.

- qid - The unique identifier returned from the *send_query* method (default = true)
- json - If true, then the response is formatted as a JSON object



<br>
<br>
### Api.wait\_results(device\_id, json=true) ###

Opens a long polling connection to the IQ Engines servers and waits until results are ready.

- device\_id - if given, the wait_result method will only return when results are ready from queries sent with the corresponding device\_id
- json - If true, then the response is formatted as a JSON object


[3]: http://developer.iqengines.com/