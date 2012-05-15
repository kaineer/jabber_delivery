Jabber Delivery
---------------

This gem adds a method to ActionMailer which enables sending messages right to jabber.

Rails Setup
-----------

First add the gem to your `Gemfile` and run the `bundle` command to install it.

  `gem "jabber_delivery"`

Then, create file `config/jabber_delivery.yml` and put there jabber credentials you're going to use:

```yml
jid: foobar@somejabber.com
password: here_goes_your_password
```

TODO: Think about switching delivery method right before activating action mailer.

Gem will be published right after I'll figure this out.

Project Status
--------------

Most of project's structure is *imported* from `letter_opener` gem and for now it's not so serious.


Development & Feedback
----------------------

Special thanks to the [letter_opener](https://github.com/ryanb/letter_opener) gem for inspiring this project.

