require 'rails_helper'

RSpec.describe "leafs/index", type: :view do
  before(:each) do
    assign(:leafs, [
      Leaf.create!(
        available_balance: 2,
        leave_type: "Leave Type",
        leave_starts: "Leave Starts",
        leave_end: "Leave End",
        total_days: 3,
        reason: "Reason",
        leave_status: false,
        employee: nil
      ),
      Leaf.create!(
        available_balance: 2,
        leave_type: "Leave Type",
        leave_starts: "Leave Starts",
        leave_end: "Leave End",
        total_days: 3,
        reason: "Reason",
        leave_status: false,
        employee: nil
      )
    ])
  end

  it "renders a list of leafs" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Leave Type".to_s, count: 2
    assert_select "tr>td", text: "Leave Starts".to_s, count: 2
    assert_select "tr>td", text: "Leave End".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Reason".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
