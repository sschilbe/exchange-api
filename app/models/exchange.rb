class Exchange < ApplicationRecord
    validates_presence_of :code, :rate
    validates :code, uniqueness: true

    def convert_to(exchange)
        # Convert to base currency (exchange always = 1) and then to new currency
        return (1/rate) * exchange.rate
    end
end
