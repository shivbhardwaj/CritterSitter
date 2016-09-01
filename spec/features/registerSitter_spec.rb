require 'rails_helper'

RSpec.describe 'Owner' do
  it 'prompts the new owner fields' do
    visit "/"
    click_button "Get Started As Pet Owner"
  end
  # it "prompts for the new pet fields" do
  #   visit "/pets/new"
  #   expect(page).to have_field('Name')
  #   expect(page).to have_field('Age')
  #   # expect(page).to have_selector("Animal", :value =>"Dog")
  #   # # expect(page).to have_label('Animal')
  #   # # select 'Option', from: 'Label'
  # end
 #  it "creates pet and redirects to pet's page" do
 #   visit "/"
 #   fill_in "Name", with: "Luke"
 #   fill_in "Age", with: 8
 #   select 'Dog', from: 'Animal'
 #   click_button "Create Pet"
 #   pet = Pet.last
 #   expect(current_path).to eq("/pets/#{pet.id}")
 #   expect(page).to have_text("Luke")
 # end
end
