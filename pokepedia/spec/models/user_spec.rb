require 'rails_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid with a duplicate email" do
    FactoryGirl.create(:user, email: "nick@nick.com")
    FactoryGirl.build(:user, email: "nick@nick.com").should_not be_valid
  end
end
