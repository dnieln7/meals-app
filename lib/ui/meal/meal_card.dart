import 'package:flutter/material.dart';
import 'package:meals/data/model/meal.dart';
import 'package:meals/ui/meal/meal_detail_page.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  MealCard(this.meal, this.removeItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    // Crops the images
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.picture,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        backgroundColor: Colors.black26),
                    softWrap: true, // Add a line break if text is too long
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text('${meal.duration} min')
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text('$complexity')
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text('$affordability')
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String get complexity {
    String message = 'Simple';

    switch (meal.complexity) {
      case Complexity.Simple:
        message = 'Simple';
        break;
      case Complexity.Challenging:
        message = 'Challenging';
        break;
      case Complexity.Hard:
        message = 'Hard';
        break;
    }

    return message;
  }

  String get affordability {
    String message = 'Simple';

    switch (meal.affordability) {
      case Affordability.Affordable:
        message = 'Affordable';
        break;
      case Affordability.Pricey:
        message = 'Pricey';
        break;
      case Affordability.Luxurious:
        message = 'Luxurious';
        break;
    }

    return message;
  }

  void selectMeal(context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailPage.path,
      arguments: meal, // When calling only gets the meal not an map
    )
        .then((result) {
      if (result != null) {
        if(removeItem != null) {
          removeItem(result);
        }
      }
    });
  }
}
