import 'package:flutter/material.dart';
import 'package:meals/data/model/meal.dart';
import 'package:meals/ui/category/categories_page.dart';
import 'package:meals/ui/favorites/favorites_page.dart';
import 'package:meals/ui/home/home_drawer.dart';

class Home extends StatefulWidget {
  final List<Meal> favoriteMeals;

  Home(this.favoriteMeals);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages;

  int selectedPage = 0;

  @override
  void initState() {
    pages = [
      CategoriesPage(),
      FavoritesPage(widget.favoriteMeals),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      drawer: HomeDrawer(),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        onTap: (index) => setState(() => selectedPage = index),
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }

  Widget get appBarTitle {
    var title = Text('');

    switch (selectedPage) {
      case 0:
        title = Text('Categories');
        break;
      case 1:
        title = Text('Favorites');
        break;
    }

    return title;
  }
}
