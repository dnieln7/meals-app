import 'package:flutter/material.dart';
import 'package:meals/ui/meal/meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color background;

  CategoryItem(this.id, this.title, this.background);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Touch event
      onTap: () => select(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      // The splash matches the border of the child
      child: Container(
        padding: const EdgeInsets.all(10), // Flutter does not recreate
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }

  void select(context) {
    Navigator.of(context).pushNamed(
      MealsPage.path,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }
}
