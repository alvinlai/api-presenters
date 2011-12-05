class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :name, :todo_list_id, :presence => true

  def self.completed?
    completed_at != nil
  end
end
