require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:authenticate)}


  it {should be_valid}

  describe "when name is not present" do
    before {@user.name=""}
    it {should_not be_valid}
  end
  describe "when email is present" do
    before {@user.email=""}
    it {should_not be_valid}
  end
  describe "when name is too long" do
    before {@user.name="fayi"*50}
    it {should_not be_valid}
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[ user@foo,com user_at.org example@user.foo. ]
      addresses.each do |invalid_email|
        @user.email = invalid_email
        @user.should_not be_valid
      end
    end
  end
  describe  "when email format is valid" do
    it "should be valid" do
      addresses = %w[ user@foo.org fayi_mor3a@twitta.net ]
      addresses.each do |valid_email|
        @user.email = valid_email
        @user.should be_valid
      end
    end
  end
  describe "when email already exists" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it {should_not be_valid}
  end
  describe "when password is not present" do
    before {@user.password = @user.password_confirmation=""}
    it {should_not be_valid}
  end
  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "mismatch"}
    it {should_not be_valid}
  end
  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil}
    it {should_not be_valid}
  end
  describe "when password is too short" do
    before {@user.password  = @user.password_confirmation = "abc"}
    it {should_not be_valid}
  end
  describe "return value of authenticate method" do
    before {@user.save}
    let(:found_user){User.find_by_email(@user.email)}

    describe "when password is valid" do
      it {should == found_user.authenticate(@user.password)}
    end
    describe "when password is invalid" do
      let(:user_for_invalid_password){found_user.authenticate("invalid")}
      it {should_not == found_user.authenticate("invalid")}
      specify {user_for_invalid_password.should be_false}
    end
  end
end
