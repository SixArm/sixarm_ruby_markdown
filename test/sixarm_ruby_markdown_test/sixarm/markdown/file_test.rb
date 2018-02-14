# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_test"

describe SixArm::Markdown::File do

  let(:dir){ File.expand_path File.dirname(__FILE__) }
  let(:file_path){ dir + "tempfile"}
  let(:text){ "foo" }

  describe "#slurp" do

    before do
      file = SixArm::Markdown::File.new(file_path, "w")
      file.write(text)
      file.close      
    end

    it "read and scrub, and return a Markdown::String" do
      file = SixArm::Markdown::File.new(file_path)
      s = file.slurp
      expect(s).must_equal text
      expect(s).must_be_kind_of SixArm::Markdown::String
    end

    after do
      File.delete(file_path)
    end

  end

end
