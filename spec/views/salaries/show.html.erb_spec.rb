require 'rails_helper'

RSpec.describe "salaries/show", type: :view do
  before(:each) do
    @salary = assign(:salary, Salary.create!(
      salary: 2,
      month: "Month",
      total: 3,
      employee: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Month/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
