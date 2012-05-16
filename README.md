Jabber Delivery
---------------

This gem adds a method to ActionMailer which enables sending messages right to jabber.

Rails Setup
-----------

First add the gem to your `Gemfile` and run the `bundle` command to install it.

```ruby
gem "jabber_delivery"
```

Then, create file `config/jabber_delivery.yml` and put there jabber credentials you're going to use:

```yaml
jid: foobar@somejabber.com
password: here_goes_your_password
```

Now I can do in my [devise](https://github.com/plataformatec/devise) resource:

```ruby
class User < ActiveRecord::Base
  # ...
  def headers_for(action)
    { :to => address,                       # Got address from email field with format {email|jabber}:(address here)
      :delivery_method => delivery_method   # Depending on prefix, use :smtp or :jabber_delivery (just for example)
    }
  end
  # ...
end
```

Hope it will help.

Project Status
--------------

Most of project's structure is *imported* from `letter_opener` gem and for now it's not so serious.


Development & Feedback
----------------------

Special thanks to the [letter_opener](https://github.com/ryanb/letter_opener) gem for inspiring this project.

