require "rails_helper"

RSpec.describe SalariesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/salaries").to route_to("salaries#index")
    end

    it "routes to #new" do
      expect(get: "/salaries/new").to route_to("salaries#new")
    end

    it "routes to #show" do
      expect(get: "/salaries/1").to route_to("salaries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/salaries/1/edit").to route_to("salaries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/salaries").to route_to("salaries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/salaries/1").to route_to("salaries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/salaries/1").to route_to("salaries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/salaries/1").to route_to("salaries#destroy", id: "1")
    end
  end
end
