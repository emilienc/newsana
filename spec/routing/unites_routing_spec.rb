require "spec_helper"

describe UnitesController do
  describe "routing" do

    it "routes to #index" do
      get("/unites").should route_to("unites#index")
    end

    it "routes to #new" do
      get("/unites/new").should route_to("unites#new")
    end

    it "routes to #show" do
      get("/unites/1").should route_to("unites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/unites/1/edit").should route_to("unites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/unites").should route_to("unites#create")
    end

    it "routes to #update" do
      put("/unites/1").should route_to("unites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/unites/1").should route_to("unites#destroy", :id => "1")
    end

  end
end
