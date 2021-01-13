import 'package:flutter/material.dart';
import 'package:meals/data/model/meal.dart';
import 'package:meals/ui/meal/meal_card.dart';

class MealsPage extends StatefulWidget {
  static const String path = '/categories/meals';

  final List<Meal> meals;

  MealsPage(this.meals);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  List<Meal> currentMeals;
  String category;
  bool firstLoad = false;

  // Stateful widget has its own context
  @override
  void initState() {
    // Before context
    super.initState();
  }

  // After context but before build
  @override
  void didChangeDependencies() {
    if (!firstLoad) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      category = args['title'];
      currentMeals = widget.meals
          .where((meal) => meal.categories.contains(args['id']))
          .toList();

      firstLoad = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes for $category'),
      ),
      body: ListView.builder(
        // To long list
        itemBuilder: (ctx, index) => MealCard(currentMeals[index], removeItem),
        itemCount: currentMeals.length,
      ),
    );
  }

  void removeItem(id) {
    setState(() {
      currentMeals.removeWhere((meal) => meal.id == id);
    });
  }
}
