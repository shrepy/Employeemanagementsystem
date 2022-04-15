require 'rails_helper'

RSpec.describe "designations/show", type: :view do
  before(:each) do
    @designation = assign(:designation, Designation.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
