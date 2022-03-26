require 'rails_helper'

RSpec.describe "salaries/new", type: :view do
  before(:each) do
    assign(:salary, Salary.new(
      salary: 1,
      month: "MyString",
      total: 1,
      employee: nil
    ))
  end

  it "renders new salary form" do
    render

    assert_select "form[action=?][method=?]", salaries_path, "post" do

      assert_select "input[name=?]", "salary[salary]"

      assert_select "input[name=?]", "salary[month]"

      assert_select "input[name=?]", "salary[total]"

      assert_select "input[name=?]", "salary[employee_id]"
    end
  end
end
