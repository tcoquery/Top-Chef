class HomeController < ApplicationController
  def show
    if current_user
      @leagues = current_user.leagues.all
    end
  end
end
