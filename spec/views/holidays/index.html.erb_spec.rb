require 'rails_helper'

RSpec.describe "holidays/index", type: :view do
  before(:each) do
    assign(:holidays, [
      Holiday.create!(
        holiday_name: "Holiday Name"
      ),
      Holiday.create!(
        holiday_name: "Holiday Name"
      )
    ])
  end

  it "renders a list of holidays" do
    render
    assert_select "tr>td", text: "Holiday Name".to_s, count: 2
  end
end
