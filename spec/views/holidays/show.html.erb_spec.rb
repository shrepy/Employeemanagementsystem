require 'rails_helper'

RSpec.describe "holidays/show", type: :view do
  before(:each) do
    @holiday = assign(:holiday, Holiday.create!(
      holiday_name: "Holiday Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Holiday Name/)
  end
end
