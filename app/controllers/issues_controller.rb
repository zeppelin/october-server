class IssuesController < ApplicationController
  respond_to :json

 def index
   response = fetch_issues(params[:owner], params[:repo]).body
   issues = response.map do |issue|
     { id: issue['number'], title: issue['title'], url: issue['url'], owner: params[:owner], repo: params[:repo] }
   end
   respond_with(issues: issues)
 end

  private
  def fetch_issues(owner, repo)
    api_get("/repos/#{owner}/#{repo}/issues")
  end

end
