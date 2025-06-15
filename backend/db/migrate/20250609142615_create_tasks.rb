class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 50, null: false
      t.string :status, limit: 50, null: false, default: 'not_started'
      t.string :category, limit: 50
      t.string :description, limit: 50

      t.references :workspace, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end