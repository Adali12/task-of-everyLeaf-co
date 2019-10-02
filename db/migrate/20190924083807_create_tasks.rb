class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :details
      t.datetime :start
      t.datetime :enddate
      t.timestamps
      t.string :status
     t.integer:priority
    end
  end
end
