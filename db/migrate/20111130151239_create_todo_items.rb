class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.integer :id
      t.string :name
      t.text :description
      t.integer :priority
      t.datetime :completed_at
      t.integer :todo_list_id

      t.timestamps
    end
  end
end
