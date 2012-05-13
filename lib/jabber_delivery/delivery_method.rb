require 'jabber_delivery/jabber_client'

#
module JabberDelivery
  class DeliveryMethod
    def initialize(options = {})
      @options = options

      raise "JID should be specified for jabber delivery" unless jid
      raise "password should be specified for jabber delivery" unless password
    end

    def deliver!(mail)
      jabber_client.deliver(mail.to.first, mail.body.to_s)
    end

  private
    #
    def jid
      @jid ||= (@options[:jid] || @options["jid"])
    end

    #
    def password
      @password ||= (@options[:password] || @options["password"])
    end

    #
    def jabber_client
      @jabber_client ||= JabberClient.new(jid, password)
    end
  end
end
