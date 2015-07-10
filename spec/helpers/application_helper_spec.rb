require 'rails_helper'

describe ApplicationHelper do
  describe "page title" do
    it "returns the default title when title option is not provided" do
      expect(helper.full_title).to eq("Project X")
    end

    it "returns the project title plus the page title" do
      expect(helper.full_title("Home")).to eq("Project X | Home")
    end
  end
end
