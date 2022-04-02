require "rails_helper"

RSpec.describe LeafsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/leafs").to route_to("leafs#index")
    end

    it "routes to #new" do
      expect(get: "/leafs/new").to route_to("leafs#new")
    end

    it "routes to #show" do
      expect(get: "/leafs/1").to route_to("leafs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/leafs/1/edit").to route_to("leafs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/leafs").to route_to("leafs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/leafs/1").to route_to("leafs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/leafs/1").to route_to("leafs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/leafs/1").to route_to("leafs#destroy", id: "1")
    end
  end
end
