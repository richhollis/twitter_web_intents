require "twitter_web_intents/version"
require "twitter_web_intents/intents"

module TwitterWebIntents

  class << self
    def respond_to_missing?(method_name, include_private=false); Intents.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); Intents.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    private

    def method_missing(method_name, *args, &block)
      return super unless Intents.respond_to?(method_name)
      Intents.send(method_name, *args, &block)
    end
  end

end
