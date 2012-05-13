#
require 'xmpp4r'

module JabberDelivery
  class JabberClient

    include Jabber

    def initialize(jid, password)
      @jid, @password = jid, password
    end

    def deliver(target_jid, message)
      client.send(chat_message(target_jid, message))
    end

  private
    #
    def client
      @client ||= Client.new(JID.new(@jid)).tap do |client|
        client.connect
        client.auth(@password)
      end
    end

    #
    def chat_message(target_jid, message)
      Message.new(target_jid, message).tap do |m|
        m.set_type(:chat)
      end
    end
  end
end
