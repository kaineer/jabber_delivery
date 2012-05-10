require "spec_helper"

describe JabberDelivery::DeliveryMethod do
  JABBER_UID = "foo@bar.bz"
  JABBER_PASSWORD = "asdfpoiuqwer"

  TARGET_UID = "bazz@bar.bz"
  MESSAGE = "Send more chunky bacon"

  before(:each) do
    jabber_uid = JABBER_UID
    jabber_password = JABBER_PASSWORD

    method = nil

    Mail.defaults do
      method = delivery_method JabberDelivery::DeliveryMethod, :uid => jabber_uid, :password => jabber_password
    end

    @method = method
  end

  it "should reach for jabber client" do
    @method.should_receive(:jabber_client)

    mail = Mail.deliver do
      from    "Anything will do aaa@aaa.aa"
      to      TARGET_UID
      subject "What subject?"
      body    MESSAGE
    end
  end
end
