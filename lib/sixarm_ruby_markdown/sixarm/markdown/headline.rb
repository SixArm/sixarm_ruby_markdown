# -*- coding: utf-8 -*-
=begin rdoc
=end

module SixArm; module Markdown; end; end

class SixArm::Markdown::Headline
  include EqualInstanceVariables

  attr_accessor \
    :text,
    :anchor,
    :level,
    :link

  def initialize(
    text: nil,
    anchor: nil,
    level: nil,
    link: nil
  )
    raise ArgumentError if !text.kind_of?(String)
    @text = text
    @anchor = anchor || self.class.text_to_anchor(text)
    @level = level
    @link = link
  end

  def anchor
    @anchor || self.class.text_to_anchor(text)
  end

  def level
    @level || 1
  end

  def link
    @link || "[#{text}](##{anchor})"
  end

  def self.parse_line(line)
    level = parse_line_level(line)
    text = trim_line(line)
    # TODO Add parser for anchor
    # TODO Add parser for Unicode normalization
    return SixArm::Markdown::Headline.new(text: text, level: level)
  end

  def self.parse_line_level(line)
    return line =~/^\s*([#=]+)/ ? $1.length : nil
  end

  def self.trim_line(line)
    line.sub(/^\s*[#=]+\s+/, '').sub(/\s+[#=]+\s*$/, '')
  end

  def self.text_to_anchor(text)
    text.downcase.gsub(/\W+/,'-').gsub(/^-+|-+$/,'')
  end

end
