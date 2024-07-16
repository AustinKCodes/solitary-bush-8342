require "rails_helper"

RSpec.describe "Recipe Show" do
  it "shows the recipe's name, complexity, genre, and ingredients" do
    recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 3)
    ingredient2 = Ingredient.create!(name: "Tomato Sauce", cost: 2)
    ingredient3 = Ingredient.create!(name: "Ground Beef", cost: 5)
    RecipeIngredient.create!(recipe: recipe, ingredient: ingredient1)
    RecipeIngredient.create!(recipe: recipe, ingredient: ingredient2)
    RecipeIngredient.create!(recipe: recipe, ingredient: ingredient3)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: Italian")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("Tomato Sauce")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Total Cost: 10")
  end
end