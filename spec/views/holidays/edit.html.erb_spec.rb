require 'rails_helper'

RSpec.describe "holidays/edit", type: :view do
  before(:each) do
    @holiday = assign(:holiday, Holiday.create!(
      holiday_name: "MyString"
    ))
  end

  it "renders the edit holiday form" do
    render

    assert_select "form[action=?][method=?]", holiday_path(@holiday), "post" do

      assert_select "input[name=?]", "holiday[holiday_name]"
    end
  end
end
