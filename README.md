# Nokogiri::Toolkit

My personal Nokogiri toolkit. I use this for wrapping Nokogiri, without having to create pull requests, test the code thoroughly etc.

## Current features

  * TestMerge, this is capable of nested to_text from a higher root node with an optional separator character (which I believe is missing from Nokogiri)


## Installation

Add this line to your application's Gemfile (bundler):

    gem 'wiki-api', git: "git://github.com/dblommesteijn/nokogiri-toolkit.git"

And then execute:

    $ bundle

Or install it yourself as (RubyGems):

    $ gem install nokogiri-toolkit

## Usage


### TextMerge (merge text with optional separator)

ruby```
# open a HTML with uri open
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Ruby_on_Rails"))
# get the bodyContent (main wiki content)
xs = doc.xpath("//div[@id='bodyContent']")

# get text of the NodeSet (using the pipe for extra clarification, you can set any other character)
text = xs.text_merge_opt "|"

# printing text verbose
puts text.inspect
```