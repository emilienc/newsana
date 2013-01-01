require "spec_helper"

describe AlimentsController do
  describe "routing" do

    it "routes to #index" do
      get("/aliments").should route_to("aliments#index")
    end

    it "routes to #new" do
      get("/aliments/new").should route_to("aliments#new")
    end

    it "routes to #show" do
      get("/aliments/1").should route_to("aliments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aliments/1/edit").should route_to("aliments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aliments").should route_to("aliments#create")
    end

    it "routes to #update" do
      put("/aliments/1").should route_to("aliments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aliments/1").should route_to("aliments#destroy", :id => "1")
    end

  end
end
