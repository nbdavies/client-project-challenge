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
  
  it "returns a published version when there is one" do
  	article = FactoryGirl.create(:article)
  	version = FactoryGirl.create(:version, published: true, article: article)
  	expect(article.published_version).to eq version
  end

  it "returns nil if the article has no published version" do 
  	article = FactoryGirl.create(:article)
  	version = FactoryGirl.create(:version, published: false, article: article)
  	expect(article.published_version).to eq nil
  end
end
