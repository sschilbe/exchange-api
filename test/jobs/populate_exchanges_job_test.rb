require 'test_helper'

class PopulateExchangesJobTest < ActiveJob::TestCase
  test "That exchange rates are stored" do
    # TODO: This test should mock out the API call to exchangerate-api and populate with static values
    PopulateExchangesJob.perform_now()
    assert(Exchange.all().length() > 0)
  end
end
