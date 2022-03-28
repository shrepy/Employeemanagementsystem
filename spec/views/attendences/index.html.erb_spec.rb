require 'rails_helper'

RSpec.describe "attendences/index", type: :view do
  before(:each) do
    assign(:attendences, [
      Attendence.create!(
        status: "Status",
        employee: nil
      ),
      Attendence.create!(
        status: "Status",
        employee: nil
      )
    ])
  end

  it "renders a list of attendences" do
    render
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
