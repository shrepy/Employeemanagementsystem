require 'rails_helper'

RSpec.describe "performances/show", type: :view do
  before(:each) do
    @performance = assign(:performance, Performance.create!(
      points: 2,
      month: "Month",
      employee: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Month/)
    expect(rendered).to match(//)
  end
end
