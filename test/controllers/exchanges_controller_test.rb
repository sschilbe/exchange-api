require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get(exchange_index_url)
    assert_response(:success)
  end

  test "should not compare exchanges if missing params" do
    get(exchange_compare_url)
    assert_response(:error)
  end

  test "should compare exchanges" do
    Exchange.create(code: "ABC", rate: 2.0)
    Exchange.create(code: "DEF", rate: 3.0)

    get(exchange_compare_url(exchange1: "ABC", exchange2: "DEF"))

    json_response = JSON.parse(response.body)
    assert_response(:success)
    assert(json_response.has_key?("rate"))
    assert(1.5, json_response["rate"])
  end
end