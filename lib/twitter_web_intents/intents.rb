require 'uri'
require 'active_support/core_ext/object/to_query'

module TwitterWebIntents

  class Intents

    # https://dev.twitter.com/docs/intents

    URL_BASE = "https://twitter.com/"

    class << self

      def get_search_url(query)
        URL_BASE + "search?q=" + URI.escape(query)
      end

      def get_profile_url(screen_name)
        URL_BASE + screen_name
      end

      def get_status_url(screen_name, user_id)
        URL_BASE + "#{screen_name}/status/#{user_id}"
      end

      def get_user_url(params)
        get_intent(:user, params, [:screen_name, :user_id])
      end

      def get_favorite_url(params)
        get_intent(:favorite, params, [:tweet_id, :related])
      end

      def get_tweet_url(params)
        get_intent(:tweet, params, [:url, :via, :text, :in_reply_to, :hashtags, :related])
      end

      def get_retweet_url(params)
        get_intent(:retweet, params, [:tweet_id, :related])
      end

      private

      def get_intent(type, params, valid)
        URL_BASE + "intent/#{type.to_s}?#{get_parameters(type, params, valid).to_query}"
      end

      def get_parameters(type, params, valid)
        counts = {}; hash = {}
        params.each do |k,v|
          raise ArgumentException.new("The parameter #{k} is not supported by the #{type} intent") if not valid.include?(k)
          counts[k] = (counts[k].nil?) ? 1 : counts[k] += 1
          hash[k] = v.is_a?(Array) ? v.join(",") : v
        end
        hash
      end

    end

  end
    
end