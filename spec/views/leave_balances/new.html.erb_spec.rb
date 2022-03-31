require 'rails_helper'

RSpec.describe "leave_balances/new", type: :view do
  before(:each) do
    assign(:leave_balance, LeaveBalance.new(
      count: 1,
      employee: nil
    ))
  end

  it "renders new leave_balance form" do
    render

    assert_select "form[action=?][method=?]", leave_balances_path, "post" do

      assert_select "input[name=?]", "leave_balance[count]"

      assert_select "input[name=?]", "leave_balance[employee_id]"
    end
  end
end
