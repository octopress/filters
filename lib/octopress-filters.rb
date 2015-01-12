require "octopress-filters/version"

unless defined? Octopress.site
  require "octopress-filters/hooks"
end

require "rubypants-unicode"
require "titlecase"

module Octopress
  module Filters

    # Returns the site's config root or '/' if the config isn't set
    #
    def root
      root_url = Octopress.site.config['root']
      root_url.nil? ? '/' : File.join('/', root_url)
    end

    def site_url
      @url ||= begin
        Octopress.site.config['url']
      rescue
        raise IOError.new "Please add your site's published url to your _config.yml, eg url: http://example.com/"
      end
    end

    # Escapes HTML content for XML
    def cdata_escape(input)
      input.gsub(/<!\[CDATA\[/, '&lt;![CDATA[').gsub(/\]\]>/, ']]&gt;')
    end

    # Returns a title cased string based on John Gruber's title case 
    # Info: http://daringfireball.net/2008/08/title_case_update
    def titlecase(input)
      input.titlecase
    end

    def smartquotes(input)
      RubyPants.new(input).to_html
    end

    # Formats a string for use as a css classname, removing illegal characters
    def classify(input)
      input.gsub(/ /,'-').gsub(/[^\w-]/,'').downcase
    end

    alias_method :sluggify, :classify

    # Remove empty lines
    def compact_newlines(input)
      input.gsub(/\n{2,}/, "\n").gsub(/^ +\n/,"")
    end

    # Join newlines 
    def join_lines(input, separator='')
      compact_newlines(input).strip.gsub(/\s*\n\s*/, separator)
    end

    # Prevent orphans in text by inserting a non-breaking space between the two last words of a string.
    def unorphan(input)
      input.sub(/\s+(\S+)\s*$/, '&nbsp;\1')
    end

    # Convert url input into a standard canonical url
    #
    def canonical_url(input)
      full_url(input).downcase.sub(/index\.html/, '')
    end

    # Prepend all urls with the full site url
    #
    # input - The content of a page or post
    #
    # Returns input with all urls expanded to include the full site url
    # e.g. /images/awesome.gif => http://example.com/images/awesome.gif
    #
    def full_urls(input)
      expand_urls(input, site_url)
    end
    
    # Prepend a url with the full site url
    #
    # input - a url
    #
    # Returns input with all urls expanded to include the full site url
    # e.g. /images/awesome.gif => http://example.com/images/awesome.gif
    #
    def full_url(input)
      expand_url(input, site_url)
    end

    # Prepends input with a url fragment
    #
    # input - An absolute url, e.g. /images/awesome.gif
    # url   - The fragment to prepend the input, e.g. /blog
    #
    # Returns the modified url, e.g /blog
    #
    def expand_url(input, url=nil)
      url ||= root
      if input =~ /^#{url}/
        input
      else
        File.join(url, input)
      end
    end

    # Prepend all absolute urls with a url fragment
    #
    # input - The content of a page or post
    # url   - The fragment to prepend absolute urls
    #
    # Returns input with modified urls
    #
    def expand_urls(input, url=nil)
      url ||= root
      input.gsub /(\s+(href|src)\s*=\s*["|']{1})(\/[^\/>]{1}[^\"'>]*)/ do
        $1 + expand_url($3, url)
      end
    end

    def strip_url_protocol(input)
      input.sub(/\w+?:\/\//,'')
    end

    module_function *instance_methods
    public *private_instance_methods.reject!{ |m| [:root].include?(m) }

  end
end



Liquid::Template.register_filter Octopress::Filters

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Filters",
    gem:         "octopress-filters",
    version:     Octopress::Filters::VERSION,
    description: "A set of nice liquid filters used by Octopress",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/filters"
  })
end
