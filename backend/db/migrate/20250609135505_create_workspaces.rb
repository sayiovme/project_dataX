class CreateWorkspaces < ActiveRecord::Migration[7.1]
  def change
    create_table :workspaces do |t|
      t.string :name, limit: 50, null:false

      t.timestamps
    end
  end
end
