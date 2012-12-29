require "spec_helper"

describe PeseesController do
  describe "routing" do

    it "routes to #index" do
      get("/pesees").should route_to("pesees#index")
    end

    it "routes to #new" do
      get("/pesees/new").should route_to("pesees#new")
    end

    it "routes to #show" do
      get("/pesees/1").should route_to("pesees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pesees/1/edit").should route_to("pesees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pesees").should route_to("pesees#create")
    end

    it "routes to #update" do
      put("/pesees/1").should route_to("pesees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pesees/1").should route_to("pesees#destroy", :id => "1")
    end

  end
end
