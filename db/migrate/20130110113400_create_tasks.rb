class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string     :title
      t.text       :description
      t.references :team

      t.timestamps
    end
    add_index :tasks, :team_id
  end
end
