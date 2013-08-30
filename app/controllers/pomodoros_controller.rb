class PomodorosController < ApplicationController
  respond_to :json

  def create
    github_issue_id = issue_params[:github_issue_id]
    owner = issue_params[:owner]
    repo = issue_params[:repo]
    issue = Issue.where(github_issue_id: github_issue_id, owner: owner, repo: repo).first
    unless issue
      title = github_issue_title(owner, repo, github_issue_id)
      issue = Issue.new(issue_params.merge(title: title))
    end

    #TODO: params[:user_id] is here so that we can create pomodoros from the command line
    user_id = pomodoro_params[:user_id] || current_user.id
    pomodoro = issue.pomodoros.build(pomodoro_params.merge(user_id: user_id))

    if issue.save
      render json: { pomodoro: pomodoro }
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

  def show
    pomodoro = Pomodoro.find(params[:id])
    issue = pomodoro.issue
    respond_with(pomodoro: {
      id: pomodoro.id,
      owner: issue.owner,
      repo: issue.repo,
      title: issue.title
    })
  end

  private
  def pomodoro_params
    params.require(:pomodoro).permit(:started_at, :completed_at, :cancelled_at, :user_id)
  end

  def issue_params
    params.require(:pomodoro).require(:issue).permit(:owner, :repo, :github_issue_id)
  end

  def github_issue_title(owner, repo, github_issue_id)
    issue = api_get("/repos/#{owner}/#{repo}/issues/#{github_issue_id}")
    issue.body.fetch("title")
  end

end
