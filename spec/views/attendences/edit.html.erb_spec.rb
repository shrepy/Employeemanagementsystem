require 'rails_helper'

RSpec.describe "attendences/edit", type: :view do
  before(:each) do
    @attendence = assign(:attendence, Attendence.create!(
      status: "MyString",
      employee: nil
    ))
  end

  it "renders the edit attendence form" do
    render

    assert_select "form[action=?][method=?]", attendence_path(@attendence), "post" do

      assert_select "input[name=?]", "attendence[status]"

      assert_select "input[name=?]", "attendence[employee_id]"
    end
  end
end
