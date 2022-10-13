class LeaguesUsersController < ApplicationController
  def new
    @leagues_users = LeaguesUsers.new
  end

  def create
    @leagues_users = LeaguesUsers.create(leagues_users_params)

    if @leagues_users.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to root_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def destroy
      @leagues_users = LeaguesUsers.where("league_id = ? AND user_id = ?", params[:id], params[:user_id]).delete_all
      redirect_to root_path
  end

  private 

  def leagues_users_params
    params.require(:leagues_users).permit(:user_id, :league_id)
  end
end
