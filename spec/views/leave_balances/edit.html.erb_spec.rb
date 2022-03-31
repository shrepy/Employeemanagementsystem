require 'rails_helper'

RSpec.describe "leave_balances/edit", type: :view do
  before(:each) do
    @leave_balance = assign(:leave_balance, LeaveBalance.create!(
      count: 1,
      employee: nil
    ))
  end

  it "renders the edit leave_balance form" do
    render

    assert_select "form[action=?][method=?]", leave_balance_path(@leave_balance), "post" do

      assert_select "input[name=?]", "leave_balance[count]"

      assert_select "input[name=?]", "leave_balance[employee_id]"
    end
  end
end
