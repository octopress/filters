# Octopress Filters

A set of handy liquid filters used by Octopress.

- full_urls - Replace relative urls with absolute urls.
- titlecase - Properly capitalize titles based on John Gruber's [Title Case](http://daringfireball.net/2008/05/title_case).
- unorphan - Insert a non-breaking space between the last two words in a title.
- sluggify - Replaces all non-word characters in a string with dashes.
- classify - An alias for sluggify (seems appropriate when working with CSS class names).
- compact_newlines - Compact groups of empty lines into one, because Liquid templates have lots of whitespace.
- join_lines - Remove all new lines, joining each line with a separator. (defaults to a space).

[![Build Status](https://travis-ci.org/octopress/filters.svg)](https://travis-ci.org/octopress/filters)
[![Gem Version](http://img.shields.io/gem/v/octopress-filters.svg)](https://rubygems.org/gems/octopress-filters)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-filters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-filters

Next add it to your gems list in Jekyll's `_config.yml`

    gems:
      - octopress-filters

## Examples

### Full urls

If you're working on an RSS feed, you'll need to be sure all of your relative urls are converted to full urls. In that case, when
rendering the content of a page, just do this:

    {{ post.content | full_urls }}

Now any relative links in your site will be expanded with the `url` configuration in Jekyll's `_config.yml`.

### Titlecase

    {{ post.title | titlecase }}  //=> This Is a Properly Capitalized Title

### Unorphan

    {{ post.title | unorphan }}  //=> This Is a Properly Capitalized&nbsp;Title

### Sluggify/Classify

    <article class="{{ post.class | classify }}">

### Compact newlines

    {{ content | compact_newlines }}

### Join lines

    {% capture page_title %}
    {{ page.title }}
    {{ site.header.title }}
    {% endcapture %}

    <head>
      <title>{{ page_title | join_lines: " - " }}</title>
      …

## Contributing

1. Fork it ( https://github.com/octopress/filters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

