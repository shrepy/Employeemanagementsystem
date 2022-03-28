require "rails_helper"

RSpec.describe AttendencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attendences").to route_to("attendences#index")
    end

    it "routes to #new" do
      expect(get: "/attendences/new").to route_to("attendences#new")
    end

    it "routes to #show" do
      expect(get: "/attendences/1").to route_to("attendences#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/attendences/1/edit").to route_to("attendences#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/attendences").to route_to("attendences#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attendences/1").to route_to("attendences#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attendences/1").to route_to("attendences#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attendences/1").to route_to("attendences#destroy", id: "1")
    end
  end
end
