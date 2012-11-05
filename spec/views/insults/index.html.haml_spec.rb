require 'spec_helper'

describe "insults/index" do
  before(:each) do
    assign(:insults, [
      stub_model(Insult,
        :insult => "Insult",
        :points => 1,
        :user => nil,
        :is_flagged => false
      ),
      stub_model(Insult,
        :insult => "Insult",
        :points => 1,
        :user => nil,
        :is_flagged => false
      )
    ])
  end

  it "renders a list of insults" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Insult".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
