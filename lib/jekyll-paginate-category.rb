require "jekyll-paginate-category/version"

module Jekyll
  module Paginate
    module Category
      
      class Pagination < Generator
        safe true
        priority :lowest

        def generate(site)
          if Paginate::Pager.pagination_enabled?(site)
            site.categories.each do |category, posts|
              total = Paginate::Pager.calculate_pages(posts, site.config['paginate'])
              (1..total).each do |i|
                site.pages << IndexPage.new(site, category, i)
              end
            end
          end
        end
      end

      class IndexPage < Page
        def initialize(site, category, num_page)
          @site = site
          @base = site.source

          category_dir = site.config['category_dir'] || 'categories'
          @dir = File.join(category_dir, category)

          @name = Paginate::Pager.paginate_path(site, num_page)
          @name.concat '/' unless @name.end_with? '/'
          @name += 'index.html'

          self.process(@name)

          category_layout = site.config['category_layout'] || 'index.html'
          self.read_yaml(@base, category_layout)
          
          self.data.merge!(
                           'title'     => category,
                           'paginator' => Paginate::Pager.new(site, num_page, site.categories[category])
                          )
        end

        def template
          '/:path/:basename:output_ext'
        end
      end
      
    end
  end
end
