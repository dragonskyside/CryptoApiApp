require './lib/base'
require './lib/coinbase'
require './lib/coin_gecko'
require './lib/coin_paprika'
require './lib/coin_cap'
require './lib/crypto_compare'

module Api
    class Wrapper < Base
        %w[
            coinbase 
            coincap
            coin_gecko
            coin_paprika
            crypto_compare
        ].each do |api|
          define_method(api.to_sym) do
            Object.const_get("Api::#{klassify(api)}")
          end
      end
      def klassify(name)
        name.split('_').collect(&:capitalize).join
      end
    end
end