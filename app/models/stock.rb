class Stock < ApplicationRecord
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: 'pk_88b14e7fa3494d1d9dd1cde54672a559',
            secret_token: 'secret_token',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            new(ticker: ticker_symbol,name: client.company(ticker_symbol).company_name,last_price:client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end
end
