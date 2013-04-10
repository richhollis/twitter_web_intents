# Twitter Web Intents Ruby Gem

[![Gem Version](https://badge.fury.io/rb/twitter_web_intents.png)][gem]
[![Build Status](https://secure.travis-ci.org/richhollis/twitter_web_intents.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/richhollis/twitter_web_intents.png?travis)][gemnasium]
[![Coverage Status](https://coveralls.io/repos/richhollis/twitter_web_intents/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/twitter_web_intents
[travis]: http://travis-ci.org/richhollis/twitter_web_intents
[gemnasium]: https://gemnasium.com/richhollis/twitter_web_intents
[coveralls]: https://coveralls.io/r/richhollis/twitter_web_intents

Twitter Web Intents provides simple helper methods that return Twitter Web Intent URLs. The parameters that are passed are verified to ensure they are valid.

You can read more about Twitter Web Intents on Twitter's site:
https://dev.twitter.com/docs/intents

## Installation

Add this line to your application's Gemfile:

    gem 'twitter_web_intents'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter_web_intents


## Methods

### get_search_url(query)

```ruby
TwitterWebIntents.get_search_url('Parmigiano-Reggiano')
#=> "https://twitter.com/search?q=Parmigiano-Reggiano"
```

### get_profile_url(screen_name)

```ruby
TwitterWebIntents.get_profile_url('warblealerts')
#=> "https://twitter.com/warblealerts
```

### get_status_url(screen_name, user_id)

```ruby
TwitterWebIntents.get_status_url('warblealerts', 318705541666988034)
#=> "https://twitter.com/warblealerts/status/318705541666988034"
```

### get_user_url(params)

Valid parameters: [:screen_name, :user_id]

```ruby
TwitterWebIntents.get_user_url({:screen_name => 'warblealerts'})
#=> "https://twitter.com/intent/user?screen_name=warblealerts"
```

OR

```ruby
TwitterWebIntents.get_user_url({:user_id => 102})
#=> https://twitter.com/intent/user/?user_id=102
```

### get_favorite_url(params)

Valid parameters: [:tweet_id, :related]

```ruby
TwitterWebIntents.get_favorite_url({:tweet_id => 318705541666988034, :related => ['warblealerts','richhollis']})
#=> "https://twitter.com/intent/favorite?related=warblealerts%2Crichhollis&tweet_id=318705541666988034"
```

### get_tweet_url(params)

Valid parameters: [:url, :via, :text, :in_reply_to, :hashtags, :related]

```ruby
TwitterWebIntents.get_tweet_url({:url => 'http://warble.co', :via => 'richhollis', :text => 'hello world', :in_reply_to => 318705541666988034, :hashtags => '#warble', :related => 'warblealerts'})
#=> "https://twitter.com/intent/tweet?hashtags=%23warble&in_reply_to=318705541666988034&related=warblealerts&text=hello+world&url=http%3A%2F%2Fwarble.co&via=richhollis"
```

### get_retweet_url(params)

Valid parameters: [:tweet_id, :related]

```ruby
TwitterWebIntents.get_retweet_url({:tweet_id => 318705541666988034, :related => ['warblealerts','richhollis']})
#=> "https://twitter.com/intent/retweet?related=warblealerts%2Crichhollis&tweet_id=318705541666988034"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes and ensure test coverage (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
