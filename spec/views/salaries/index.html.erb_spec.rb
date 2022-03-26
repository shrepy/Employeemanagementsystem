require 'rails_helper'

RSpec.describe "salaries/index", type: :view do
  before(:each) do
    assign(:salaries, [
      Salary.create!(
        salary: 2,
        month: "Month",
        total: 3,
        employee: nil
      ),
      Salary.create!(
        salary: 2,
        month: "Month",
        total: 3,
        employee: nil
      )
    ])
  end

  it "renders a list of salaries" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Month".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
