class HomeController < ApplicationController
  def index
    @insult = Insult.new
  end
end
