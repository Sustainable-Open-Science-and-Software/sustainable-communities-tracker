# From https://jekyllrb.com/docs/plugins/generators/ but heavily modded

module PageGeneratorPlugin
  class RepoPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.data['repo']['repo'].each do |repo|
        site.pages << RepoPage.new(site, repo['reponame'])
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class RepoPage < Jekyll::Page
    def initialize(site, reponame)
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = 'repos'         # the directory the page will reside in.

      # All pages have the same filename, so define attributes straight away.
      @basename = reponame      # filename without the extension.
      @ext      = '.html'      # the extension.
      @name     = @basename + @ext # basically @basename + @ext.

      # Initialize data hash with a key pointing to all posts under current category.
      # This allows accessing the list in a template via `page.linked_docs`.
      @data = {
        'reponame' => reponame,
        "layout" => "single_repo"
      }

    end


    # Placeholders that are used in constructing page URL.
    def url_placeholders
      {
        :path   => "repo",
        :basename   => basename,
        :output_ext => output_ext
      }
    end
  end
end
