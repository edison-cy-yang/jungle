require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(last_name: "yang", first_name: "edison", email: "edison@gmail.com", password: "12345", password_confirmation: "12345")
  }
  describe "Validations" do 
    it "should be valid" do
      expect(subject).to be_valid
    end
    it "should not be valid when password and password_confirmation are not the same" do
      subject.password = "23456"
      expect(subject).to_not be_valid
    end
    it "should not be valid when password or password_confirmation is missing" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid when first_name is missing" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid when last_name is missing" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid when email is missing" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    context "when email is not unique" do
      before {described_class.create!(last_name: "yang", first_name: "edison", email: "Edison@gmail.com", password: "12345", password_confirmation: "12345")}
      it "should not be valid" do
        expect(subject).to be_invalid
      end
    end
    it "should not be valid when password is too short" do
      subject.password = "123"
      subject.password_confirmation = "123"
      expect(subject).to be_invalid
    end
  end

  describe ".authenticate_with_credentials" do 
    context "when a user is already registered" do
      before {described_class.create!(last_name: "yang", first_name: "edison", email: "Edison@gmail.com", password: "12345", password_confirmation: "12345")}
      it "should be valid given correct email and password" do
        user = User.authenticate_with_credentials("Edison@gmail.com", "12345")
        expect(user).to be_a(User)
      end
      it "should be able to authenticate with trailing spaces in email" do
        user = User.authenticate_with_credentials(" Edison@gmail.com", "12345")
        expect(user).to be_a(User)
      end
      it "should be able to authenticate with wrong case in email" do
        user = User.authenticate_with_credentials("EdIson@gmail.com", "12345")
        expect(user).to be_a(User)
      end
    end
  end
end
