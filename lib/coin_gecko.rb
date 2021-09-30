module Api
    class CoinGecko < Base
        def request  
              super(:get, url)
        end

        def parsed_response(response)
            response.dig('tickers').first.dig('last')
        end

        def url
            pair = @options.fetch(:pair, 'usd')
            "https://api.coingecko.com/v3/coins/#{@options[:name]}"
        end
    end
end