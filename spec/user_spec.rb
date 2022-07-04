require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validation" do
    it "should save and also create the user if valid " do
      @user = User.new(first_name: "Sang", last_name: "Lee", email: "sang@example.com", password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user).to be_present
    end

    it "should not be validating if no password is present " do
      @user = User.new(first_name: "Sang", last_name: "Lee", email: "Sang@example.com", password: nil, password_confirmation: '1234')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not be validating in password confirmation isnt given" do
      @user = User.new(first_name: "Sang", last_name: "Lee", email: "Sang@example.com", password: '1234', password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "should not be validating if password input and confirmation input are different" do
      @user = User.new(first_name: "Sang", last_name: "Lee", email: "Sang@example.com", password: '1234', password_confirmation: 'asdf')
      expect(@user).to_not be_valid
    end

    it "should not be validating if the email address input already exists" do
      @user1 = User.create(first_name: "Sang", last_name: "Lee", email: "test@example.com", password: 'asdf', password_confirmation: 'asdf')
      @user2 = User.create(first_name: "Yoon", last_name: "Lee", email: "TEST@example.com", password: '1234', password_confirmation: '1234')
      expect(@user2).to_not be_valid
    end

    it "should not be validating if first name is not inputted" do
      @user = User.create(first_name: nil, last_name: "Lee", email: "test@example.com", password: 'asdf', password_confirmation: 'asdf')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "should not be validating if email address is not inputted" do
      @user = User.create(first_name: "Sang", last_name: "Lee", email: nil, password: 'asdf', password_confirmation: 'asdf')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"

    end

    it "should not be validating if last name is not inputted" do
      @user = User.create(first_name: "Sang", last_name: nil, email: "test@example.com", password: 'asdf', password_confirmation: 'asdf')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "should have a password minimum length of 4" do
      @user = User.new(first_name: "Sang", last_name: "Lee", email: "Sang@example.com", password: '123', password_confirmation: '123')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
    end

  end
  
  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.create(id: "1", first_name: "Sang", last_name: "Lee", email: "sang@example.com", password: "1234", password_confirmation: '1234')
    end

    it "should not allow login without username" do
      @user_login = User.authenticate_with_credentials(nil,'1234')
      expect(@user_login).to be false
    end

    it "should not allow login without password" do
      @user_login = User.authenticate_with_credentials("test@example.com",nil)
      expect(@user_login).to be false
    end

    it "should not allow login without usernmame and password that is not valid" do
      @user_login = User.authenticate_with_credentials("Sang@example.com",'123456789')
      expect(@user_login).to be false
    end

    it "should allow login with valid usernmame and passwords" do
      @user_login = User.authenticate_with_credentials("Sang@example.com", "1234")
      expect(@user_login).to eq @user
    end

    it "should let user login with some space before and/or after email" do
        @user_login = User.authenticate_with_credentials("    Sang@example.com ", '1234')
        expect(@user_login).to eq @user
      end
  
      it "should let user login regardless of the capital/lower case in email" do
        @user_login = User.authenticate_with_credentials("Sang@EXAMPLE.com", '1234')
        expect(@user_login).to eq @user
      end
  end

end