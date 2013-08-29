class IssuesController < ApplicationController
  respond_to :json

 def index
   response = fetch_issues(params[:owner], params[:repo]).body
   issues = response.map do |issue|
     { id: issue['id'], title: issue['title'], url: issue['url'] }
   end
   respond_with(issues: issues)
 end

  private
  def fetch_issues(owner, repo)
    api_get("/repos/#{owner}/#{repo}/issues")
  end

end
