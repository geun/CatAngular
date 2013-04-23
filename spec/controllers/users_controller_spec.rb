require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:users)
    sign_in @user
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:users).should == @user
    end
    
  end

end
