require 'rails_helper'

RSpec.describe "performances/index", type: :view do
  before(:each) do
    assign(:performances, [
      Performance.create!(
        points: 2,
        month: "Month",
        employee: nil
      ),
      Performance.create!(
        points: 2,
        month: "Month",
        employee: nil
      )
    ])
  end

  it "renders a list of performances" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Month".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
