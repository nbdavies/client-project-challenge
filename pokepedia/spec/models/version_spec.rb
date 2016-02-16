require 'rails_helper'

describe Version do
  it "has a valid factory" do
    FactoryGirl.create(:version).should be_valid
  end
  it "is invalid without an article" do
    FactoryGirl.build(:version, article_id: nil).should_not be_valid
  end
  it "is invalid without an author" do
    FactoryGirl.build(:version, author_id: nil).should_not be_valid
  end
end


