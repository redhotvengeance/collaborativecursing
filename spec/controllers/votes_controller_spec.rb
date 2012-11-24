require 'spec_helper'

describe VotesController do

  describe "GET 'vote'" do
    it "returns http success" do
      get 'vote'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
