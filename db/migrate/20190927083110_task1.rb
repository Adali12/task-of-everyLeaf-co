class Task1 < ActiveRecord::Migration[5.2]
  change_column :tasks, :name, :details, null: false
end
