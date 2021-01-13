class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String picture;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegetarian;
  final bool vegan;
  final List<String> ingredients;
  final List<String> steps;

  Meal({
    this.id,
    this.categories,
    this.title,
    this.picture,
    this.duration,
    this.complexity,
    this.affordability,
    this.glutenFree,
    this.lactoseFree,
    this.vegetarian,
    this.vegan,
    this.ingredients,
    this.steps,
  });
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}
