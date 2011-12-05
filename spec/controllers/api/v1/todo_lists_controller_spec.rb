require 'spec_helper'

describe Api::V1::TodoListsController do
  before :all do
    @todo_list = Factory(:todo_list)
  end

  context "index" do
    it "should list TodoLists" do
      get :index
      response.status.should == 200
      todo_lists = JSON.parse(response.body)
      todo_lists.any? do |todo_list|
        todo_list["name"] == @todo_list.name
      end.should be_true
    end
  end

  context "show" do
    it "should show a TodoList" do
      get :show, :id => @todo_list.id
      response.status.should == 200
      todo_list = JSON.parse(response.body)
      todo_list["name"].should == @todo_list.name
    end
  end

  context "create" do
    it "should create a TodoList with valid params" do
      post :create, :todo_list => { :name => 'New Todo List' }
      response.status.should == 201
      todo_list = JSON.parse(response.body)
      todo_list["name"].should == 'New Todo List'
    end

    it "should render validation error with invalid params" do
      post :create, :todo_list => { }
      response.status.should == 422
      errors = JSON.parse(response.body)
      errors['name'].should include("can't be blank")
    end
  end

end
