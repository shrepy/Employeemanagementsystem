require 'rails_helper'

RSpec.describe "leave_balances/show", type: :view do
  before(:each) do
    @leave_balance = assign(:leave_balance, LeaveBalance.create!(
      count: 2,
      employee: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
