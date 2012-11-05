require 'spec_helper'

describe "insults/new" do
  before(:each) do
    assign(:insult, stub_model(Insult,
      :insult => "MyString",
      :points => 1,
      :user => nil,
      :is_flagged => false
    ).as_new_record)
  end

  it "renders new insult form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insults_path, :method => "post" do
      assert_select "input#insult_insult", :name => "insult[insult]"
      assert_select "input#insult_points", :name => "insult[points]"
      assert_select "input#insult_user", :name => "insult[user]"
      assert_select "input#insult_is_flagged", :name => "insult[is_flagged]"
    end
  end
end
