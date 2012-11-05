require 'spec_helper'

describe "insults/show" do
  before(:each) do
    @insult = assign(:insult, stub_model(Insult,
      :insult => "Insult",
      :points => 1,
      :user => nil,
      :is_flagged => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Insult/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
