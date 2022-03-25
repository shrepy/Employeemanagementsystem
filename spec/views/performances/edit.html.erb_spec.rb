require 'rails_helper'

RSpec.describe "performances/edit", type: :view do
  before(:each) do
    @performance = assign(:performance, Performance.create!(
      points: 1,
      month: "MyString",
      employee: nil
    ))
  end

  it "renders the edit performance form" do
    render

    assert_select "form[action=?][method=?]", performance_path(@performance), "post" do

      assert_select "input[name=?]", "performance[points]"

      assert_select "input[name=?]", "performance[month]"

      assert_select "input[name=?]", "performance[employee_id]"
    end
  end
end
