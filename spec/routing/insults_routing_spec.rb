require "spec_helper"

describe InsultsController do
  describe "routing" do

    it "routes to #index" do
      get("/insults").should route_to("insults#index")
    end

    it "routes to #new" do
      get("/insults/new").should route_to("insults#new")
    end

    it "routes to #show" do
      get("/insults/1").should route_to("insults#show", :id => "1")
    end

    it "routes to #edit" do
      get("/insults/1/edit").should route_to("insults#edit", :id => "1")
    end

    it "routes to #create" do
      post("/insults").should route_to("insults#create")
    end

    it "routes to #update" do
      put("/insults/1").should route_to("insults#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/insults/1").should route_to("insults#destroy", :id => "1")
    end

  end
end
