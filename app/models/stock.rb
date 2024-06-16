class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    validates :name, :ticker , presence: true
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: 'pk_88b14e7fa3494d1d9dd1cde54672a559',
            secret_token: 'secret_token',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            console.log(client.price)
            new(ticker: ticker_symbol,name: client.company(ticker_symbol).company_name,last_price:client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end

    def self.check_db(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
end
