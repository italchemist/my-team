class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.references :team

      t.timestamps
    end
    add_index :vacancies, :team_id
  end
end
