require "rails_helper"

RSpec.describe LeaveBalancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/leave_balances").to route_to("leave_balances#index")
    end

    it "routes to #new" do
      expect(get: "/leave_balances/new").to route_to("leave_balances#new")
    end

    it "routes to #show" do
      expect(get: "/leave_balances/1").to route_to("leave_balances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/leave_balances/1/edit").to route_to("leave_balances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/leave_balances").to route_to("leave_balances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/leave_balances/1").to route_to("leave_balances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/leave_balances/1").to route_to("leave_balances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/leave_balances/1").to route_to("leave_balances#destroy", id: "1")
    end
  end
end
