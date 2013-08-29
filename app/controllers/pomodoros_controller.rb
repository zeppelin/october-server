class PomodorosController < ApplicationController

  def create
    github_issue_id = issue_params[:github_issue_id]
    owner = issue_params[:owner]
    repo = issue_params[:repo]
    issue = Issue.where(github_issue_id: github_issue_id, owner: owner, repo: repo).first || Issue.new(issue_params)
    pomodoro = issue.pomodoros.build(pomodoro_params)

    if issue.save
      render json: {pomodoro: pomodoro}
    else
      render action: 'new'
    end
  end

  def update
    pomodoro = Pomodoro.find(params[:id])
    pomodoro.update_attributes(pomodoro_params)
    pomodoro.save!
    render json: {pomodoro: pomodoro}
  end

  private
    def pomodoro_params
      params.require(:pomodoro).permit(:started_at, :completed_at, :cancelled_at)
    end

    def issue_params
      params.require(:pomodoro).require(:issue).permit(:owner, :repo, :github_issue_id)
    end

end
