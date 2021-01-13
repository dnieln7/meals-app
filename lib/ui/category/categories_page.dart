import 'package:flutter/material.dart';
import 'package:meals/data/service/CategoriesDataService.dart';
import 'package:meals/ui/category/category_item.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Max width
          childAspectRatio: 1.5, // Height Shrink
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: CategoriesDataService.categories
            .map((category) => CategoryItem(
                category.id, category.title, Theme.of(context).accentColor))
            .toList(),
      ),
    );
  }
}
