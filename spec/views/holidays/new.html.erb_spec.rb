require 'rails_helper'

RSpec.describe "holidays/new", type: :view do
  before(:each) do
    assign(:holiday, Holiday.new(
      holiday_name: "MyString"
    ))
  end

  it "renders new holiday form" do
    render

    assert_select "form[action=?][method=?]", holidays_path, "post" do

      assert_select "input[name=?]", "holiday[holiday_name]"
    end
  end
end
