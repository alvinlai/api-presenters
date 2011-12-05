class Api::V1::TodoListsController < Api::V1::BaseController
  before_filter :find_todo_list, :only => [:show]

  def index
    present TodoList.all
  end

  def show
    present @todo_list
  end

  def create
    @todo_list = TodoList.new(params[:todo_list])
    @todo_list.save
    present @todo_list
  end

  private

  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
