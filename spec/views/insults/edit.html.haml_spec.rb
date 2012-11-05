require 'spec_helper'

describe "insults/edit" do
  before(:each) do
    @insult = assign(:insult, stub_model(Insult,
      :insult => "MyString",
      :points => 1,
      :user => nil,
      :is_flagged => false
    ))
  end

  it "renders the edit insult form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insults_path(@insult), :method => "post" do
      assert_select "input#insult_insult", :name => "insult[insult]"
      assert_select "input#insult_points", :name => "insult[points]"
      assert_select "input#insult_user", :name => "insult[user]"
      assert_select "input#insult_is_flagged", :name => "insult[is_flagged]"
    end
  end
end
