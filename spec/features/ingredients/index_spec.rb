require "rails_helper"

RSpec.describe "Ingredients Index" do
  it "should show all ingredient's names and costs" do
    ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    ingredient2 = Ingredient.create!(name: "Salt", cost: 4)

    visit "/ingredients"

    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
  end
end