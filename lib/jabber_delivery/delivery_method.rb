require 'pry'

#
module JabberDelivery
  class DeliveryMethod
    def initialize(options = {})
      @options = options
      binding.pry

      raise "UID should be specified for jabber delivery" unless uid
      raise "password should be specified for jabber delivery" unless password
    end

    def deliver!(mail)
      binding.pry
      jabber_client
    end

  private
    #
    def uid
      @uid ||= (@options[:uid] || @options["uid"])
    end

    #
    def password
      @password ||= (@options[:password] || @options["password"])
    end

    #
    def jabber_client
    end
  end
end
