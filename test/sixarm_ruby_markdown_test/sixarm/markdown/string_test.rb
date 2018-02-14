# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_test"

describe SixArm::Markdown::String do

  describe "#new" do

    it "ok" do
      expect(SixArm::Markdown::String.new).must_be_kind_of(SixArm::Markdown::String)
    end

  end

end
