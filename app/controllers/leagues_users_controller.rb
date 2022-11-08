class LeaguesUsersController < ApplicationController
  def new
    @leagues_users = LeaguesUsers.new
  end

  def create
    @league = League.find(params[:leagues_users][:league_id])

    unless @league.password.nil?
      if params[:leagues_users][:password].empty?  
        redirect_to league_path(@league.id)
        flash[:alert] = "Le mot de passe ne peut pas être vide."
      elsif params[:leagues_users][:password] == @league.password
        @leagues_users = LeaguesUsers.create(leagues_users_params)
        if @leagues_users.save
          flash[:notice] = "Tu as bien rejoint cette ligue!"
          redirect_to league_path(@league.id)
        end
      elsif params[:leagues_users][:password] != @league.password
        redirect_to league_path(@league.id), status: :unprocessable_entity
        flash[:alert] = "Le mot de passe est erroné."
      end
    else
      @leagues_users = LeaguesUsers.create(leagues_users_params)
      if @leagues_users.save
        flash[:notice] = "Tu as bien rejoint cette ligue!"
        redirect_to league_path(@league.id)
      else
        redirect_to league_path(@league.id), status: :unprocessable_entity
        flash[:alert] = "Le mot de passe est erroné."
      end
    end
  end

  def destroy
      @leagues_users = LeaguesUsers.where("league_id = ? AND user_id = ?", params[:id], params[:user_id]).delete_all
      redirect_to leagues_path
  end

  private 

  def leagues_users_params
    params.require(:leagues_users).permit(:user_id, :league_id)
  end
end
