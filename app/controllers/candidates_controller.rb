class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def create
    @user_team = Team.where('league_id = ? AND user_id = ?', params[:league], current_user.id).first

    if @user_team.candidate_one_id.nil?
      @user_team.candidate_one_id = params[:candidate_id]
    elsif @user_team.candidate_two_id.nil?
      @user_team.candidate_two_id = params[:candidate_id] 
    elsif @user_team.candidate_three_id.nil?
      @user_team.candidate_three_id = params[:candidate_id] 
    elsif @user_team.candidate_four_id.nil?
      @user_team.candidate_four_id = params[:candidate_id]    
    end

    @user_team.save

    redirect_to candidates_path
  end

end
