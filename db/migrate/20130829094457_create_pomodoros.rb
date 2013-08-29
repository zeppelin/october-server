class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :cancelled_at
      t.belongs_to :issue

      t.timestamps
    end
  end
end
