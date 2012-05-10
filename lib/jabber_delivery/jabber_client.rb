#
require 'xmpp4r'

module JabberDelivery
  class JabberClient
    def initialize(jid, password)
      @uid, @password = uid, password
    end

    def deliver(target_jid, message)
      client.send(chat_message(target_jid, message))
    end

  private
    #
    def client
      @client ||= begin
        Jabber::Client.new(Jabber::JID.new(@jid)).tap do |client|
          client.connect
          client.auth(@password)
        end
      end
    end

    #
    def chat_message(target_jid, message)
      Jabber::Message.new(target_jid, message).tap do |m|
        m.set_type(:chat)
      end
    end
  end
end
