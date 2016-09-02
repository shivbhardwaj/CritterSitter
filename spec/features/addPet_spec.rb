require 'rails_helper'

RSpec.describe 'Pet' do
  it 'prompts the new pet fields' do
    visit "/pets/new"
    expect(page).to have_text('Add a new pet')
    expect(page).to have_field('Name')
    expect(page).to have_field('Age')
    expect(page).to have_select("pet[animal_id]")
  end
  it 'saves a valid pet entry' do
    owner=Owner.create(
    first_name: "Jane",
    last_name: "Doe",
    email: "janethebest@codingdojo.com", 
    phone: '14085556666', 
    address: '1920 Zanker Road', 
    city: 'San Jose', 
    state: 'CA', 
    zip: '95112', 
    password: 'test', 
    password_confirmation: 'test'
   )

   expect(Owner.first)
  end
end
