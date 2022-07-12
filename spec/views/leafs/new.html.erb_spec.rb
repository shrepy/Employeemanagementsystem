require 'rails_helper'

RSpec.describe "leafs/new", type: :view do
  before(:each) do
    assign(:leaf, Leaf.new(
      available_balance: 1,
      leave_type: "MyString",
      leave_starts: "MyString",
      leave_end: "MyString",
      total_days: 1,
      reason: "MyString",
      leave_status: false,
      employee: nil
    ))
  end

  it "renders new leaf form" do
    render

    assert_select "form[action=?][method=?]", leafs_path, "post" do

      assert_select "input[name=?]", "leaf[available_balance]"

      assert_select "input[name=?]", "leaf[leave_type]"

      assert_select "input[name=?]", "leaf[leave_starts]"

      assert_select "input[name=?]", "leaf[leave_end]"

      assert_select "input[name=?]", "leaf[total_days]"

      assert_select "input[name=?]", "leaf[reason]"

      assert_select "input[name=?]", "leaf[leave_status]"

      assert_select "input[name=?]", "leaf[employee_id]"
    end
  end
end
