import 'package:flutter/material.dart';
import 'package:meals/data/model/meal.dart';
import 'package:meals/ui/meal/meal_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: favoriteMeals.isEmpty ? Center(
          child: Text('You have no favorites yet - Start adding some!'),) : ListView.builder(
          // To long list
          itemBuilder: (ctx, index) => MealCard(favoriteMeals[index], null),
          itemCount: favoriteMeals.length,
        ),
    );
  }
}
