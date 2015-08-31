module Octopress
  module Filters

    if defined?(Jekyll::Hooks)

      Jekyll::Hooks.register :site, :post_read do |site|
        Octopress::Filters.site = site
      end
      
      Jekyll::Hooks.register :post, :pre_render do |post, payload|
        excerpted = post.content.match(post.site.config['excerpt_separator'])
        payload['excerpted'] = !!excerpted
      end

    else

      require 'octopress-hooks'

      class SiteGrabber < Hooks::Site
        def post_read(site)
          Octopress::Filters.site = site
        end
      end

      class PostHooks < Hooks::Post
        def pre_render(post)
          excerpted = post.content.match(post.site.config['excerpt_separator'])
          post.data.merge!({'excerpted' => !!excerpted})
        end
      end
    end
  end
end
