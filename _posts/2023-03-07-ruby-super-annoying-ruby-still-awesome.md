---
layout: post
date: 2023-03-07 21:05:00
tags: ruby
title: Ruby super( ) annoying, Ruby still awesome
---

Coding is hard, though some say I make it look easy. Here’s a fun Ruby surprise I experienced recently.

This is not exactly how the classes looked, but we had a base class like the following:

```ruby
class Acme::Base
  def initialize
    @auth_token = ENV['ACME_AUTH_TOKEN'] # Used later in a private method.
  end

  def create
    # Make POST request to endpoint using auth token...
  end
end
```

And we had some sub classes that inherited from this base class:

```ruby
class Acme::Endpoint1 < Acme::Base
  def initialize(some_input)
    @some_input = some_input # Different input for each sub class.
  end

  def url
    '/endpoint_1'
  end
end

class Acme::Endpoint2 < Acme::Base
  # Same as above but with /endpoint_2
end

class Acme::Endpoint3 < Acme::Base
  # Same as above but with /endpoint_3
end
```

I needed to be able to use a different auth token sometimes with something like:

```ruby
# Existing behaviour.
Acme::Endpoint1.new(some_input).create

# New behaviour.
token = ENV['ACME_OTHER_AUTH_TOKEN']
Acme::Endpoint1.new(some_input, auth_token: token).create
```

So I decided to change `initialize` in the `Base` and `Endpoint` classes like this:

```ruby
class Acme::Base
  def initialize(auth_token: ENV['ACME_AUTH_TOKEN'])
    @auth_token = auth_token
  end
end

class Acme::Endpoint1 < Acme::Base
  def initialize(some_input, auth_token: ENV['ACME_AUTH_TOKEN'])
    super(auth_token: auth_token)
  end
end
```

Notice I added `(auth_token: ENV['ACME_AUTH_TOKEN'])` to these `initialize` methods, I set the `@auth_token` instance variable in the base class, and I call `super` in the `Endpoint1` sub class.

This way I can pass in an `auth_token` or use `ENV['ACME_AUTH_TOKEN']` as the default.

All the tests passed so I pushed to production.

The next day I was notified that the all the requests to `Endpoint2` and `Endpoint3` were failing because they were missing the auth token. I knew right away *where* the problem was. I had a fun hour and a half figuring *why* the problem was.

I thought, *“obviously I have to call the super function in the other base classes”*, so I added this:

```ruby
class Acme::Endpoint2 < Acme::Base
  def initialize(some_input)
    super
  end
end

class Acme::Endpoint3 < Acme::Base
  def initialize(some_input)
    super
  end
end
```

I ran the tests and I got:

```ruby
ArgumentError: wrong number of arguments (given 1, expected 0)
```

This is because `Acme::Base#initialize` is expecting keyword arguments but for some reason it’s receiving positional arguments.

I googled. I found this [StackOverflow post](https://stackoverflow.com/a/38041877/6615480) about `super` and updated it to this:

```ruby
class Acme::Endpoint2 < Acme::Base
  def initialize(some_input)
    super()
  end
end

class Acme::Endpoint3 < Acme::Base
  def initialize(some_input)
    super()
  end
end
```

Notice that I added parenthesis to `super`. Now we’re telling ruby not to pass `some_input` as an argument to the `super` method. In Ruby, you don’t usually have closed parentheses for methods that are not receiving arguments. This is not how I expected it to work.

I even added some extra tests that fail without `super()`. All tests passed. This time I also tested `Endpoint2` and `Endpoint3` in our pre-production environment.

I pushed to production. They still failed.

I thought this is completely illogical. My tests pass locally and in our continuous integration server. I thought something must be wrong somewhere other than my code. I already spent too much time on this. Time to brute force:

```ruby
class Acme::Endpoint2 < Acme::Base
  def initialize(some_input)
    super(auth_token: ENV['ACME_AUTH_TOKEN'])
  end
end

class Acme::Endpoint3 < Acme::Base
  def initialize(some_input)
    super(auth_token: ENV['ACME_AUTH_TOKEN'])
  end
end
```

Yup. I shoved the `auth_token: ENV['ACME_AUTH_TOKEN']` into `super`. Works in pre-production, works in production.

I still don’t know why this didn’t work in production but the brute force approach worked so I’m moving on with my life. I already spent an hour and a half solving this, and now another hour writing this post.

I’ve been using Ruby since 2015 and I believe this is the first time I’ve encountered this situation. It was "super" annoying.

Every language has its quirks and I still like Ruby. I generally favour [composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance) but this was a new low.

Moral of the story: **Avoid Inheritance unless it’s money from your family.**
