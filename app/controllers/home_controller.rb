class HomeController < ApplicationController
  def index
    @topics = Topic.topped.order('updated_at desc')
  end
end
