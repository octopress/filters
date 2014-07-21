# Octopress Filters

A set of handy liquid filters used by Octopress.

- full_urls - Replace relative urls with absolute urls (searches for `href` and `src` properties).
- full_url - Replace a relative url with an absolute url.
- canonical_url - Convert a url to the proper canonical version.
- titlecase - Properly capitalize titles with John Gruber’s [Title Case](http://daringfireball.net/2008/05/title_case).
- smartquotes - Smartly curl your quotation marks with John Gruber’s [Smarty Pants](http://daringfireball.net/projects/smartypants/).
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

Any relative links in your site will be expanded with the `url` configuration in Jekyll's `_config.yml`. This filter only affects urls
beginning with `/` inside of `href` or `src` attributes.

    {{ post.content | full_urls }}

You might use this if you're working on an RSS feed, you'll need to be sure all relative urls in your content are expanded to full urls.

### Full url

This filter prepends input with the `url` configuration in Jekyll's `_config.yml`.

    {{ post.url | full_url }}

### Canonical url

This filter expands the url to be a full url, then removes "index.html" if it is present. Here are some examples.

    {{ "about/index.html" | canonical_url }}  //=> http://example.com/about/
    {{ "about.html" | canonical_url }}        //=> http://example.com/about.html
    {{ "/" | canonical_url }}                 //=> http://example.com/

### Titlecase

    {{ post.title | titlecase }}  //=> This Is a Properly Capitalized Title

### Smartquote

    {{ post.content | smartquotes }}

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

