# -*- coding: utf-8 -*-
=begin rdoc
=end

module SixArm; module Markdown; end; end

class SixArm::Markdown::File < ::File

  def slurp
    SixArm::Markdown::String.new(read.scrub)
  end

end
