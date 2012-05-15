module JabberDelivery
  class Railtie < Rails::Railtie
    initializer "jabber_delivery.add_delivery_method" do
      ActionMailer::Base.add_delivery_method :jabber_delivery, JabberDelivery::DeliveryMethod, YAML.load_file(Rails.root.join("config/jabber_delivery.yml"))
    end
  end
end
