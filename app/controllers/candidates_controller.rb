class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def create
    @user_team = Team.where('league_id = ? AND user_id = ?', params[:league], current_user.id).first

    @user_team.candidate_one_id = params[:candidate_id]
    @user_team.save
  end

end
