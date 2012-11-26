require 'spec_helper'

describe FlagsController do

  describe "GET 'flag'" do
    it "returns http success" do
      get 'flag'
      response.should be_success
    end
  end

  describe "GET 'unflag'" do
    it "returns http success" do
      get 'unflag'
      response.should be_success
    end
  end

end
