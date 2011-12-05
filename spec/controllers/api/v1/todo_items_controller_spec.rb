require 'spec_helper'

describe Api::V1::TodoItemsController do
  before :all do
    @todo_list1 = Factory(:todo_list, :todo_items => FactoryGirl.build_list(:todo_item, 1))
    @todo_list1 = Factory(:todo_list, :todo_items => FactoryGirl.build_list(:todo_item, 5))
  end

  context "index" do
    it "should list TodoItems" do
      get :index
      response.status.should == 200
      todo_items = JSON.parse(response.body)
      todo_items.any? do |todo_item|
        todo_item["name"] == @todo_item.name
      end.should be_true
    end
  end

  context "show" do
    it "should show a TodoItem on show" do
      get :show, :id => @todo_item.id
      response.status.should == 200
      todo_item = JSON.parse(response.body)
      todo_item["name"].should == @todo_item.name
    end
  end

  context "create" do
    it "should create a TodoItem with valid params" do
      post :create, :todo_item => { :name => 'New Todo Item' }
      response.status.should == 201
      todo_item = JSON.parse(response.body)
      todo_item["name"].should == 'New Todo Item'
    end

    it "should render validation error with invalid params" do
      post :create, :todo_item => { }
      response.status.should == 422
      errors = JSON.parse(response.body)
      errors['name'].should include("can't be blank")
    end
  end

end
