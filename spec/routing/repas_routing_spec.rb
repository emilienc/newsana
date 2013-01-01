require "spec_helper"

describe RepasController do
  describe "routing" do

    it "routes to #index" do
      get("/repas").should route_to("repas#index")
    end

    it "routes to #new" do
      get("/repas/new").should route_to("repas#new")
    end

    it "routes to #show" do
      get("/repas/1").should route_to("repas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/repas/1/edit").should route_to("repas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/repas").should route_to("repas#create")
    end

    it "routes to #update" do
      put("/repas/1").should route_to("repas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/repas/1").should route_to("repas#destroy", :id => "1")
    end

  end
end
