require 'httparty'

module Api 
    class Base
        attr_accessor :options

        def initialize(options)
            @options = options
        end
        
        def request(type, url, opt = {})
          HTTParty.send(type, url, opt).yield_self do |response|
            parsed_response(response)
          end
        end

        def parsed_response(response)
            "#{_method_}"
        end
    end
end