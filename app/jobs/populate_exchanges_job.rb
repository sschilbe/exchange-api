require 'net/http'
require 'json'

class PopulateExchangesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Setting URL
    uri = URI("https://open.exchangerate-api.com/v6/latest")
    response = Net::HTTP.get(uri)

    # Get all current exchange rates
    # TODO: Error handling for when API returns a bad response (do not want to wipe-out all current exchanges if there aren't new values)
    response_obj = JSON.parse(response)

    # Map all current rates to the stored format
    rates = response_obj['rates']
    exchanges = rates.keys.map { |code|
      {
        code: code,
        rate: rates[code]
      }
    }

    # Upsert all current exchanges
    Exchange.upsert_all(exchanges, unique_by: [:code])
  end
end
