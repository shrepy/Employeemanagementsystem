require 'rails_helper'

RSpec.describe "attendences/new", type: :view do
  before(:each) do
    assign(:attendence, Attendence.new(
      status: "MyString",
      employee: nil
    ))
  end

  it "renders new attendence form" do
    render

    assert_select "form[action=?][method=?]", attendences_path, "post" do

      assert_select "input[name=?]", "attendence[status]"

      assert_select "input[name=?]", "attendence[employee_id]"
    end
  end
end
