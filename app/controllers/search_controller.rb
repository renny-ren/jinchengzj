class SearchController < ApplicationController
  def index
    search_modules = [Topic, User]
    search_params = {
      query: {
        simple_query_string: {
          query: params[:q],
          default_operator: "AND",
          minimum_should_match: "70%",
          fields: %w(title body username nickname)
        }
      },
      highlight: {
        pre_tags: ["[h]"],
        post_tags: ["[/h]"],
        fields: { title: {}, body: {}, username: {}, nickname: {} }
      }
    }
    @result = Elasticsearch::Model.search(search_params, search_modules)
  end
end