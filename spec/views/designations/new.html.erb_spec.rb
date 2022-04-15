require 'rails_helper'

RSpec.describe "designations/new", type: :view do
  before(:each) do
    assign(:designation, Designation.new(
      name: "MyString"
    ))
  end

  it "renders new designation form" do
    render

    assert_select "form[action=?][method=?]", designations_path, "post" do

      assert_select "input[name=?]", "designation[name]"
    end
  end
end
