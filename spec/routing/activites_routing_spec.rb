require "spec_helper"

describe ActivitesController do
  describe "routing" do

    it "routes to #index" do
      get("/activites").should route_to("activites#index")
    end

    it "routes to #new" do
      get("/activites/new").should route_to("activites#new")
    end

    it "routes to #show" do
      get("/activites/1").should route_to("activites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/activites/1/edit").should route_to("activites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/activites").should route_to("activites#create")
    end

    it "routes to #update" do
      put("/activites/1").should route_to("activites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activites/1").should route_to("activites#destroy", :id => "1")
    end

  end
end
