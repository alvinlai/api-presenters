class Api::V1::TodoItemsController < Api::V1::BaseController
  before_filter :find_todo_list
  before_filter :find_todo_items, :only => [:index]
  before_filter :find_todo_item, :only => [:show]

  def index
    present @todo_items
  end

  def show
    present @todo_item
  end

  def create
    @todo_item = TodoItem.new(params[:todo_item])
    @todo_item.save
    present @todo_item
  end

  private

  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id]) if params[:todo_list_id]
  end

  def find_todo_items
    @todo_items = @todo_list ? @todo_list.todo_items : TodoItem.all
  end

  def find_todo_item
    if @todo_list
      @todo_item = @todo_list.todo_items.find(params[:id])
    else
      @todo_item = TodoItem.find(params[:id])
    end
  end
end

