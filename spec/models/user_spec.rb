require 'spec_helper'

describe User do
   

  before(:each) do
      @attr = {
        :name => "Example User",
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
      }
      @user = User.create!(@attr)

  end
   
  describe "user validations" do

    it "should create a new instance given valid attributes" do
      User.create!(@attr)
    end
    
    it "should require a name" do
        no_name_user = User.new(@attr.merge(:name => ""))
        no_name_user.should_not be_valid
    end
    
    it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

  end
  
  describe "password validations" do
  
      it "should require a password" do
        User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
      end
      it "should require a matching password confirmation" do
        User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
      end
      it "should reject short passwords" do
        short = "a" * 5
        hash = @attr.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
      it "should reject long passwords" do
        long = "a" * 41
        hash = @attr.merge(:password => long, :password_confirmation => long)
        User.new(hash).should_not be_valid
      end
  end
  
  describe "password encryption" do
    before(:each) do
    end
  
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  end

end

