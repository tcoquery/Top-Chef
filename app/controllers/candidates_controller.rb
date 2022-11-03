class CandidatesController < ApplicationController

  def index
    @drafted_candidates = []

    @league_teams = Team.where('league_id = ?', params[:league])

    @league_teams.each do |team| 
      @drafted_candidates.push(team.candidate_one.id) unless team.candidate_one.nil? 
      @drafted_candidates.push(team.candidate_two.id) unless team.candidate_two.nil? 
      @drafted_candidates.push(team.candidate_three.id) unless team.candidate_three.nil? 
      @drafted_candidates.push(team.candidate_four.id) unless team.candidate_four.nil? 
    end

    @candidates = Candidate.all
  end

  def create
    @user_team = Team.where('league_id = ? AND user_id = ?', params[:league], current_user.id).first
    @league_teams = Team.where('league_id = ?', params[:league]).length

    if @user_team.candidate_one_id.nil?
      @user_team.candidate_one_id = params[:candidate_id]
    elsif @user_team.candidate_two_id.nil?
      @user_team.candidate_two_id = params[:candidate_id] 
    elsif @user_team.candidate_three_id.nil?
      @user_team.candidate_three_id = params[:candidate_id] 
    elsif @user_team.candidate_four_id.nil?
      @user_team.candidate_four_id = params[:candidate_id]    
    end

    if @league_teams == @user_team.draft_order 
      Team.where('league_id = ? AND draft_order = ?', params[:league], 1).first.update(can_draft: true)
    else 
      Team.where('league_id = ? AND draft_order = ?', params[:league], @user_team.draft_order + 1).first.update(can_draft: true)
    end 

    @user_team.can_draft = false

    @user_team.save

    redirect_to league_path(id: params[:league])
  end

end
