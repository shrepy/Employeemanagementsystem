require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        status: "Status",
        description: "MyText",
        ticket_type: 2,
        employee: nil
      ),
      Ticket.create!(
        status: "Status",
        description: "MyText",
        ticket_type: 2,
        employee: nil
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
