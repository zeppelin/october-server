class IssuesController < ApplicationController

 def index
    # current_user = User.find(1)
    owner = params[:owner]
    repo = params[:repo]
    issues = Issue.where(owner: owner, repo: repo)

    issues = issues.map do |i|
      {
        id: i.id,
        title: i.title,
        pomodoro_count: i.pomodoros.count
      }
    end
    render json: {issues: issues}
  end
end