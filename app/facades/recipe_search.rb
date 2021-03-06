# rubocop:disable Naming/AccessorMethodName

class RecipeSearch
  def initialize(ingredients)
    @ingredients = ingredients
    @service = RecipeMicroservice.new
  end

  def get_recipe_names
    @recipe_json ||= @service.get_recipes(@ingredients)
    recipes = []
    @recipe_json.each do |recipe_data|
      recipes << Recipe.new(recipe_data, self)
    end
    recipes
  end

  def get_recipe_information(id)
    @service.get_recipe_info(id)
  end
end

# rubocop:enable Naming/AccessorMethodName
