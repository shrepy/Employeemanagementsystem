require 'rails_helper'

RSpec.describe "salaries/edit", type: :view do
  before(:each) do
    @salary = assign(:salary, Salary.create!(
      salary: 1,
      month: "MyString",
      total: 1,
      employee: nil
    ))
  end

  it "renders the edit salary form" do
    render

    assert_select "form[action=?][method=?]", salary_path(@salary), "post" do

      assert_select "input[name=?]", "salary[salary]"

      assert_select "input[name=?]", "salary[month]"

      assert_select "input[name=?]", "salary[total]"

      assert_select "input[name=?]", "salary[employee_id]"
    end
  end
end
