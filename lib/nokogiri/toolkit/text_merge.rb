module Nokogiri
  module Toolkit

    # TextMerge: collect texts from nested nodes, option parameter is appended
    # 
    #   Default nokogiri's text method returns all texts merged together without
    #   a spacing option for nodes in between.
    #
    #   Example (https://en.wikipedia.org/wiki/Ruby_on_Rails 2013-04-05):
    #     RubyWeb 2.0Web application frameworksSoftware using the MIT licenseHidden
    #     Ruby Web 2.0 Web application frameworks Software using the MIT license Hidden (with " ")
    #     Ruby|Web 2.0|Web application frameworks|Software using the MIT license|Hidden (with "|")
    #

    module TextMerge

      # to append to Nokigiri::XML::Element
      module Element

        def text_merge_opt option = ''
          collect = ""
          self.traverse do |t|
            next unless t.is_a? Nokogiri::XML::Text
            collect.concat(t.text).concat(option)
          end
          collect.strip.squeeze(option)
        end

      end

      # to append to Nokigiri::XML::NodeSet
      module NodeSet

        def text_merge_opt option = ''
          collect{|j| j.text_merge_opt(option)}.join('')
        end

      end

    end
  end
end

# extend module to Nokogiri
Nokogiri::XML::Element.send :include, Nokogiri::Toolkit::TextMerge::Element
Nokogiri::XML::NodeSet.send :include, Nokogiri::Toolkit::TextMerge::NodeSet
