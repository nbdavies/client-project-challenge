require 'rails_helper'

describe Categorization do
  it "has a category" do
    version = FactoryGirl.create(:version_with_category)
    categorization = version.categorizations.last
    expect(categorization.category.class).to be Category
  end
  it "has a version" do
    version = FactoryGirl.create(:version_with_category)
    categorization = version.categorizations.last
    expect(categorization.version).to be version
  end
end

