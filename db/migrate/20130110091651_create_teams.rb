class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string     :name
      t.date       :created_at
    end
  end
end
