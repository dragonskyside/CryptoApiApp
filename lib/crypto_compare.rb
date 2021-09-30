module Api
    class CryptoCompare < Base
        def request  
              super(:get, url)
        end

        def parsed_response(response)
            response.dig('USD').to_f
        end

        def url
            pair = @options.fetch(:pair, 'usd')
            "https://min-api.cryptocompare.com/data/price?fsym=#{@options[:symbol]}tsyms=usd"
        end
    end
end