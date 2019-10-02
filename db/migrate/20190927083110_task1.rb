class Task1 < ActiveRecord::Migration[5.2]
  change_column_null :tasks, :name, false
  change_column_null :tasks, :details, false
end
