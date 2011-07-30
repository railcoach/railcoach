require 'spec_helper'

describe ApplicationHelper do
  describe "#markdown" do
    it "should convert markdown to html" do
      markdown("**Hello**, _World_!").strip
        .should eq "<p><strong>Hello</strong>, <em>World</em>!</p>"
    end

    it "should sanitize html" do
      markdown("<script>evil!</script>").strip
        .should be_empty
    end
  end
end
