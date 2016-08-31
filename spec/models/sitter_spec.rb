require 'rails_helper'

RSpec.describe Sitter, type: :model do
  it "should not save if email already exists" do
    Sitter.create(
    first_name: "Jane",
    last_name: "Doe",
    email: "janethebest@codingdojo.com"
   )
   sitter = Sitter.new(
    first_name: "Jane",
    last_name: "Smith",
    email: "janethebest@codingdojo.com"
   )
   expect(sitter).to be_invalid
  end
  it "should not save if first_name field is blank" do
    sitter=Sitter.new(first_name: '')
    expect(sitter).to be_invalid
  end
  it "must be a valid email" do
    sitter=Sitter.create(first_name: 'Harry', last_name: 'Potter', email: '123.com')
    expect(sitter).to be_invalid
  end
  it "should save a valid user" do
    sitter=Sitter.create(
    first_name: "Jane",
    last_name: "Doe",
    email: "janethebest@codingdojo.com",
    password: "password",
    password_confirmation: "password",
    zip: '95014',
    phone: '123456789',
    start_date: '09/10/16',
    end_date: '09/14/16',
    address: "1920 Zanker Road",
    city: 'San Jose'
   )
   expect(sitter).to be_valid
   expect(sitter.first_name).to eq('Jane')
  end
end
