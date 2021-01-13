import 'package:flutter/material.dart';
import 'package:meals/data/service/MealsDataService.dart';
import 'package:meals/ui/home/home.dart';
import 'package:meals/ui/meal/meal_detail_page.dart';
import 'package:meals/ui/meal/meals_page.dart';
import 'package:meals/ui/settings/settings_page.dart';

import 'data/model/meal.dart';

void main() => runApp(Meals());

class Meals extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> favoriteMeals = [];
  List<Meal> availableMeals = MealsDataService.meals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        scaffoldBackgroundColor: Color.fromRGBO(255, 254, 234, 1),
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.w600,
              ),
              subtitle: TextStyle(
                fontSize: 15,
                fontFamily: 'QuickSand',
              ),
              body1: TextStyle(fontFamily: 'QuickSand'),
              body2: TextStyle(fontFamily: 'QuickSand'),
            ),
      ),
      // Instead of home property, defaults to /
      initialRoute: '/categories',
/*      // Generate this for any routes that are not registered
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => Home()),*/
      // Generated when flutter fails to generate a page; example error page
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => Home(favoriteMeals)),
      routes: {
        '/categories': (ctx) => Home(favoriteMeals),
        MealsPage.path: (ctx) => MealsPage(availableMeals),
        MealDetailPage.path: (ctx) => MealDetailPage(toggleFavorite, isMealFavorite),
        SettingsPage.path: (ctx) => SettingsPage(filters, updateFilters),
      },
    );
  }

  void updateFilters(filters) {
    setState(() {
      this.filters = filters;

      availableMeals = MealsDataService.meals.where((meal) {
        if (this.filters['gluten'] && !meal.glutenFree) {
          return false;
        }
        if (this.filters['lactose'] && !meal.lactoseFree) {
          return false;
        }
        if (this.filters['vegetarian'] && !meal.vegetarian) {
          return false;
        }
        if (this.filters['vegan'] && !meal.vegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(id) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(
          MealsDataService.meals.firstWhere((meal) => meal.id == id),
        );
      });
    }
  }

  bool isMealFavorite(id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }
}
