require 'rails_helper'

RSpec.describe "attendences/show", type: :view do
  before(:each) do
    @attendence = assign(:attendence, Attendence.create!(
      status: "Status",
      employee: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
