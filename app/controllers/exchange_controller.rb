class ExchangeController < ApplicationController
    def index
        exchanges = Exchange.all()
        render json: exchanges
    end

    def compare
        if (params.has_key?(:exchange1) && params.has_key?(:exchange2)) then
            # TODO: Verify valid exchange codes provided in params
            exchange1 = Exchange.find_by_code(params[:exchange1])
            exchange2 = Exchange.find_by_code(params[:exchange2])

            render json: {rate: exchange1.convert_to(exchange2)}
        else
            render json: {error: 'Invalid params, expected exchange1 and exchange2'}.to_json, status: 500
        end
    end
end
