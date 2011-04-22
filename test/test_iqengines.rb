require 'helper'
device_id=Time.now.utc.strftime("%Y%m%d%H%M%S")
class TestIQEngiensApi < Test::Unit::TestCase
  should "be able to send query" do
      require 'iqengines'
      api = IQEngines.Api()
      qid, response = api.send_query('./test/a.jpeg', device_id=device_id)
      puts response
  end
  should "be able to wait for results" do
      api = IQEngines.Api()
      response = api.wait_results(device_id=device_id)
      puts response
      response = api.get_result(device_id=device_id)
  end

end
