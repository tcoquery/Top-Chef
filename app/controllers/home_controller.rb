class HomeController < ApplicationController
  def show
    @leagues = League.all
  end
end
