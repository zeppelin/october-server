class PomidoroController < ApplicationController

  def create
    github_issue_id = issue_params[:github_issue_id]
    issue = Issue.where(github_issue_id: github_issue_id).first || Issue.new(issue_params)
    pomodoro = issue.pomidoro.build(pomodoro_params)

    if issue.save
      render json: {pomodoro: pomodoro}
    else
      render action: 'new'
    end
  end

  private
    def pomodoro_params
      params.require(:pomodoro).permit(:started_at, :completed_at, :canceled_at)
    end

    def issue_params
      params.require(:pomodoro).require(:issue).permit(:owner, :repo, :github_issue_id)
    end

end
