require 'rails_helper'

describe Article do
  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end
  it "is invalid without an author" do
    FactoryGirl.build(:article, author_id: nil).should_not be_valid
  end
end
