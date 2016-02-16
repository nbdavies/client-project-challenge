require 'rails_helper'

describe Category do
  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:category, name: nil).should_not be_valid
  end
  it "with a version has associated version" do
    version = FactoryGirl.create(:version_with_category)
    category = version.categories.last
    expect(category.versions).to include version
  end
  it "must be unique" do
    FactoryGirl.create(:category, name: "Alex")
    expect(FactoryGirl.build(:category, name: "Alex")).not_to be_valid
  end
end
