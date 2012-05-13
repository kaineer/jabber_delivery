require "spec_helper"

describe JabberDelivery::JabberClient do
  TARGET_JID = "target@jid.co"
  MESSAGE    = "Send me more chunky bacon"

  before(:each) do
    @jabber_client = JabberDelivery::JabberClient.new("foo@bar.bz", "123123")
    @client_mock = mock("client")
    @client_mock.stub!(:send)

    @message_mock = mock("message")

    @jabber_client.stub!(:client).and_return(@client_mock)
    @jabber_client.stub!(:chat_message).and_return(@message_mock)
  end

  context "#deliver" do
    after(:each) do
     	@jabber_client.deliver(TARGET_JID, MESSAGE)
    end

    it "should get client" do
      @jabber_client.should_receive(:client)
    end

    it "should get chat_message" do
      @jabber_client.should_receive(:chat_message)
    end

    it "should call client#send with chat message" do
      @client_mock.should_receive(:send).with(@message_mock)
    end
  end
end