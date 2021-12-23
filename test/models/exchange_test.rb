require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test 'Exchange is valid with code and rate' do
    exchange = Exchange.new(code: 'ABC', rate: 1.00)
    assert(exchange.valid?)
  end

  test 'Exchange is invalid without a code' do
    exchange = Exchange.new(code: nil)
    assert_not(exchange.valid?)
  end

  test 'Exchange is invalid without a rate' do
    exchange = Exchange.new(code: 'ABC', rate: nil)
    assert_not(exchange.valid?)
  end

  test 'Exchange code must be unique' do
    Exchange.create(code: 'ABC', rate: 1.00)
    exchange = Exchange.new(code: 'ABC', rate: 2.0)
    assert_not(exchange.valid?)
  end

  test 'Exchange comparison' do
    current_exchange = exchanges(:exchange1)
    new_exchange = exchanges(:exchange2)

    assert(1.25, current_exchange.convert_to(new_exchange))
  end
end
