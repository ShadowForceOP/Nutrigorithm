enum RecipeType {
breakfast,
lunch,
dinner,
snack,
dessert
}

class Recipe {
final String name;
final String imageUrl;
final RecipeType type;
final List<String> ingredients;

const Recipe(this.name, this.imageUrl, this.type, this.ingredients);
}