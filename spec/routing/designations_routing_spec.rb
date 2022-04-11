require "rails_helper"

RSpec.describe DesignationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/designations").to route_to("designations#index")
    end

    it "routes to #new" do
      expect(get: "/designations/new").to route_to("designations#new")
    end

    it "routes to #show" do
      expect(get: "/designations/1").to route_to("designations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/designations/1/edit").to route_to("designations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/designations").to route_to("designations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/designations/1").to route_to("designations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/designations/1").to route_to("designations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/designations/1").to route_to("designations#destroy", id: "1")
    end
  end
end
