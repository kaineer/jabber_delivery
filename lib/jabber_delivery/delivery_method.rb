require 'jabber_delivery/jabber_client'

#
module JabberDelivery
  class DeliveryMethod
    def initialize(options = {})
      @options = options

      raise "UID should be specified for jabber delivery" unless uid
      raise "password should be specified for jabber delivery" unless password
    end

    def deliver!(mail)
      jabber_client.deliver(mail.to.first, mail.body.to_s)
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
      @jabber_client ||= JabberClient.new(uid, password)
    end
  end
end
