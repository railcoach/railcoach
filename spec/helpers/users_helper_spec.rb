require 'spec_helper'

describe UsersHelper do
  describe "translate_gender" do
    context "when asting to translate m" do
      it "should return the 'male'" do
        result = helper.translate_gender('m')
        result.should == 'male'
      end
    end

    context "when asting to translate f" do
      it "should return the 'male'" do
        result = helper.translate_gender('f')
        result.should == 'female'
      end
    end

    context "when asting to translate another variable" do
      it "should return the input variable" do
        input = 'foobar'
        result = helper.translate_gender(input)
        result.should == input
      end
    end
  end
end
