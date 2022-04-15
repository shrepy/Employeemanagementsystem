require 'rails_helper'

RSpec.describe "designations/index", type: :view do
  before(:each) do
    assign(:designations, [
      Designation.create!(
        name: "Name"
      ),
      Designation.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of designations" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
