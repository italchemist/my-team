class CreateVacancySkills < ActiveRecord::Migration
  def change
    create_table :vacancy_skills do |t|
      t.references :vacancy
      t.references :skill

      t.timestamps
    end
    add_index :vacancy_skills, :vacancy_id
    add_index :vacancy_skills, :skill_id
  end
end
