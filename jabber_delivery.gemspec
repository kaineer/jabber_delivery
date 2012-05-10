Gem::Specification.new do |s|
  s.name        = "jabber_delivery"
  s.version     = "0.0.1"
  s.author      = "Tangerine Cat"
  s.email       = "kaineer@gmail.com"
  s.homepage    = "http://github.com/kaineer/jabber_delivery"
  s.summary     = "Send messages to jabber uid instead of email."
  s.description = "When mail is sent from your application, Jabber Delivery will send it to jabber uid instead of email."

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_dependency "xmpp4r"

  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'mail', '~> 2.3.0'
  s.add_development_dependency 'ZenTest'
  s.add_development_dependency 'pry'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
