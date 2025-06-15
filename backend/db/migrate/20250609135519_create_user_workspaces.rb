class CreateUserWorkspaces < ActiveRecord::Migration[7.1]
  def change
    create_table :user_workspaces do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_workspaces, [:user_id, :workspace_id], unique: true # A user cannot join the same workspace more than once.
  end
end