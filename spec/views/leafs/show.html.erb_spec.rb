require 'rails_helper'

RSpec.describe "leafs/show", type: :view do
  before(:each) do
    @leaf = assign(:leaf, Leaf.create!(
      available_balance: 2,
      leave_type: "Leave Type",
      leave_starts: "Leave Starts",
      leave_end: "Leave End",
      total_days: 3,
      reason: "Reason",
      leave_status: false,
      employee: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Leave Type/)
    expect(rendered).to match(/Leave Starts/)
    expect(rendered).to match(/Leave End/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Reason/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
