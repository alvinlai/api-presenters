class TodoList < ActiveRecord::Base
  has_many :todo_items, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

  def hello
    "Hello from TodoList"
  end
end
