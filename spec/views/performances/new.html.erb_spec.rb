require 'rails_helper'

RSpec.describe "performances/new", type: :view do
  before(:each) do
    assign(:performance, Performance.new(
      points: 1,
      month: "MyString",
      employee: nil
    ))
  end

  it "renders new performance form" do
    render

    assert_select "form[action=?][method=?]", performances_path, "post" do

      assert_select "input[name=?]", "performance[points]"

      assert_select "input[name=?]", "performance[month]"

      assert_select "input[name=?]", "performance[employee_id]"
    end
  end
end
