require 'rails_helper'

RSpec.describe "leave_balances/index", type: :view do
  before(:each) do
    assign(:leave_balances, [
      LeaveBalance.create!(
        count: 2,
        employee: nil
      ),
      LeaveBalance.create!(
        count: 2,
        employee: nil
      )
    ])
  end

  it "renders a list of leave_balances" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
