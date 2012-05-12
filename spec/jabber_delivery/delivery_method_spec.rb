require "spec_helper"

describe JabberDelivery::DeliveryMethod do
  JABBER_UID = "foo@bar.bz"
  JABBER_PASSWORD = "asdfpoiuqwer"

  TARGET_UID = "bazz@bar.bz"
  MESSAGE = "Send more chunky bacon"

  context "#deliver!" do
    before(:each) do
      jabber_uid = JABBER_UID
      jabber_password = JABBER_PASSWORD

      method = nil

      Mail.defaults do
        method = delivery_method JabberDelivery::DeliveryMethod, :uid => jabber_uid, :password => jabber_password
      end

      @method = method

      ### Rather hack, 'cause I'm not too good in rspec yet
      @method.stub(:dup).and_return(@method)

      @jabber_client = mock("jabber_client")
      @jabber_client.stub(:deliver)

      @method.stub(:jabber_client).and_return(@jabber_client)
    end

    after(:each) do
      mail = Mail.deliver do
        to      TARGET_UID
        body    MESSAGE
      end
    end

    it "should reach for jabber client" do
      @method.should_receive(:jabber_client)
    end

    it "should call jabber client's deliver method with parameters from `email'" do
      @jabber_client.should_receive(:deliver).with(TARGET_UID, MESSAGE)
    end
  end
end
