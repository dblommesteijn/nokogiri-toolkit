require 'rubygems'
require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../../lib/nokogiri/toolkit")

require 'open-uri'
#
# Testing the connection to https://www.mediawiki.org/wiki/API:Main_page
#

class NokotkUseTextOption < Test::Unit::TestCase

  CONFIG = { uri: "https://en.wikipedia.org/wiki/Ruby_on_Rails" }

  def setup
  end

  def teardown
  end

  def test_download_page_parse_text_merge
    doc = Nokogiri::HTML(open(CONFIG[:uri]))
    xs = doc.xpath("//div[@id='bodyContent']")

    # original text result
    assert !xs.text.include?("frameworks Software"), "not expected unfused words"
    assert xs.text.include?("frameworksSoftware"), "expected fused words"

    # add option to append to text after each node
    text = xs.text_merge_opt "|"
    assert text.include?("frameworks Software"), "expected unfused words"
    assert !text.include?("frameworksSoftware"), "not expected unfused words"
  end



end
