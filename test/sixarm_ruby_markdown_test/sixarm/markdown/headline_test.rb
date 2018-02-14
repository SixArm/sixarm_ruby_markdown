# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_test"

describe SixArm::Markdown::Headline do

  let(:text){ "Foo Goo Hoo" }
  let(:anchor_default) { "foo-goo-hoo"}
  let(:anchor_custom) { "bar-car-dar"}
  let(:level_default){ 1 }
  let(:level_custom){ 3 }
  let(:link_default){ "[Foo Goo Hoo](#foo-goo-hoo)" }
  let(:link_custom){ "[My Link Text](#my-link-anchor)" }
  let(:headline){ SixArm::Markdown::Headline.new(text: text) }

  describe "#text" do

    it "return text" do
      expect(headline.text).must_equal text
    end

  end

  describe "#anchor" do

    describe "with default, which is no anchor, thus uses autogeneration" do

      it "return default anchor" do
        headline = SixArm::Markdown::Headline.new(text: text) 
        expect(headline.anchor).must_equal anchor_default
      end

    end

    describe "with custom anchor" do

      it "return custom anchor" do
        headline = SixArm::Markdown::Headline.new(text: text, anchor: anchor_custom) 
        expect(headline.anchor).must_equal anchor_custom
      end

    end

  end

  describe "#level" do

    describe "with default, which is no level, thus uses default level which is 1" do

      it "return default level, which is 1 i.e. suitable for HTML H1" do
        headline = SixArm::Markdown::Headline.new(text: text) 
        expect(headline.level).must_equal level_default
      end

    end

    describe "with custom level" do

      it "return custom level" do
        headline = SixArm::Markdown::Headline.new(text: text, level: level_custom) 
        expect(headline.level).must_equal level_custom
      end

    end

  end

  describe "#link" do

    describe "with default, which is no link, thus uses autogeneration" do

      it "return default link, which is the Markdown formatting of the text and anchor" do
        expect(headline.link).must_equal link_default
      end

    end

    describe "with custom link" do

      it "return custom link" do
        headline = SixArm::Markdown::Headline.new(text: text, link: link_custom) 
        expect(headline.link).must_equal link_custom
      end

    end

  end

  describe ".parse_line" do

    it "parse a headline that starts with hash characters" do
      line = "### Hello"
      headline = SixArm::Markdown::Headline::parse_line(line)
      expect(headline.text).must_equal "Hello"
      expect(headline.level).must_equal 3
    end

    it "parse a headline that starts with equal characters" do
      line = "=== Hello"
      headline = SixArm::Markdown::Headline::parse_line(line)
      expect(headline.text).must_equal "Hello"
      expect(headline.level).must_equal 3
    end

    it "trim extraneous characters i.e. leading/trailing spaces and leading/trailing hashes" do
      line = "   ###   Hello   ###   "
      headline = SixArm::Markdown::Headline::parse_line(line)
      expect(headline.text).must_equal "Hello"
      expect(headline.level).must_equal 3
    end

  end

  describe ".parse_line_level" do

    it "return level" do
      line = "### Hello"
      expect = 3
      actual = SixArm::Markdown::Headline::parse_line_level(line)
      expect(actual).must_equal expect
    end

  end

  describe ".trim_line" do

    it "trim extraneous characters i.e. leading/trailing spaces and leading/trailing hashes" do
      line = "   ###   Hello   ###   "
      expect = "Hello"
      actual = SixArm::Markdown::Headline::trim_line(line)
      expect(actual).must_equal actual
    end

  end

  describe ".text_to_anchor" do

    it "return anchor, which is the text as lowercase, and replacing every run of non-word characters with a dash" do
      text = "Foo ! Goo ! Hoo"
      expect = "foo-goo-hoo"
      actual = SixArm::Markdown::Headline::text_to_anchor(text)
      expect(actual).must_equal expect
    end

  end

end
