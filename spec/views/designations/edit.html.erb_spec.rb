require 'rails_helper'

RSpec.describe "designations/edit", type: :view do
  before(:each) do
    @designation = assign(:designation, Designation.create!(
      name: "MyString"
    ))
  end

  it "renders the edit designation form" do
    render

    assert_select "form[action=?][method=?]", designation_path(@designation), "post" do

      assert_select "input[name=?]", "designation[name]"
    end
  end
end
