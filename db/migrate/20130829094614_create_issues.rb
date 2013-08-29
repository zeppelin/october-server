class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :owner
      t.string :repo
      t.integer :github_issue_id
      t.string :title

      t.timestamps
    end
  end
end
