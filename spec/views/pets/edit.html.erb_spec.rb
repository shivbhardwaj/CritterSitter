require 'rails_helper'

RSpec.describe "pets/edit", type: :view do
  before(:each) do
    @pet = assign(:pet, Pet.create!(
      :owner => nil,
      :name => "MyString",
      :age => 1,
      :animal => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit pet form" do
    render

    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do

      assert_select "input#pet_owner_id[name=?]", "pet[owner_id]"

      assert_select "input#pet_name[name=?]", "pet[name]"

      assert_select "input#pet_age[name=?]", "pet[age]"

      assert_select "input#pet_animal_id[name=?]", "pet[animal_id]"

      assert_select "input#pet_image[name=?]", "pet[image]"
    end
  end
end
