class HomeController < ApplicationController
  def show
    @leagues = current_user.leagues.all
  end
end
