import 'package:flutter/material.dart';
import 'package:meals/data/model/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const String path = '/categories/meals/detail';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailPage(this.toggleFavorite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    bool favorite = isMealFavorite(meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
        actions: <Widget>[
          favorite
              ? Container()
              : IconButton(
                  icon: Icon(Icons.delete),
                  tooltip: 'Delete meal',
                  onPressed: () => Navigator.of(context).pop(meal.id),
                ),
          IconButton(
            icon: Icon(
              favorite ? Icons.star : Icons.star_border,
            ),
            tooltip: 'Delete meal',
            onPressed: () => toggleFavorite(meal.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.picture,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(thickness: 2),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 200,
                child: createIngredientsList(meal),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 200,
                child: createStepsList(meal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createIngredientsList(Meal meal) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          meal.ingredients[index],
          textAlign: TextAlign.center,
        ),
      ),
      itemCount: meal.ingredients.length,
    );
  }

  Widget createStepsList(Meal meal) {
    return ListView.builder(
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text(meal.steps[index]),
      ),
      itemCount: meal.steps.length,
    );
  }
}
