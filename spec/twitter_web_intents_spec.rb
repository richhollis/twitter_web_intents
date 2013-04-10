require 'spec_helper'

describe TwitterWebIntents do

  subject { TwitterWebIntents }

  describe "#get_search_url" do
    it "returns correct url" do
      expect(subject.get_search_url('#wshoppr')).to eq("https://twitter.com/search?q=%23wshoppr")
    end
  end

  describe "#get_profile_url" do 
    it "returns correct url" do
      expect(subject.get_profile_url('richhollis')).to eq("https://twitter.com/richhollis")
    end
  end

  describe "#get_status_url" do
    it "returns correct url" do
      expect(subject.get_status_url('richhollis', 123456789)).to eq("https://twitter.com/richhollis/status/123456789")
    end
  end

  describe "#get_user_url" do
    it "returns correct url" do
      expect(subject.get_user_url({:screen_name => 'richhollis'})).to eq("https://twitter.com/intent/user?screen_name=richhollis")
    end
    it "raises when parameter is invalid" do
      expect{subject.get_user_url({:not_valid => 1})}.to raise_error
    end
  end

  describe "#get_retweet_url" do
    it "returns correct url" do
      expect(subject.get_retweet_url({:tweet_id => 123456789})).to eq("https://twitter.com/intent/retweet?tweet_id=123456789")
    end
    it "raises when parameter is invalid" do
      expect{subject.get_retweet_url({:not_valid => 1})}.to raise_error
    end
  end

  describe "#get_favorite_url" do
    it "returns correct url" do
      expect(subject.get_favorite_url({:tweet_id => 123456789})).to eq("https://twitter.com/intent/favorite?tweet_id=123456789")
    end
    it "raises when parameter is invalid" do
      expect{subject.get_favorite_url({:not_valid => 1})}.to raise_error
    end
  end

  describe "#get_tweet_url" do
    it "returns correct url for text" do
      hash = {:text => "Intellectual property has the shelf life of a banana", :related => ['warblealerts', 'jesseddy', 'richhollis']}
      expect(subject.get_tweet_url(hash)).to eq("https://twitter.com/intent/tweet?related=warblealerts%2Cjesseddy%2Crichhollis&text=Intellectual+property+has+the+shelf+life+of+a+banana")
    end
    it "returns correct url for in_reply_to" do
      hash = {:in_reply_to => 123456789, :via => 'warblealerts'}
      expect(subject.get_tweet_url(hash)).to eq("https://twitter.com/intent/tweet?in_reply_to=123456789&via=warblealerts")
    end
    it "raises when parameter is invalid" do
      expect{subject.get_tweet_url({:not_valid => 1})}.to raise_error
    end
  end

end
