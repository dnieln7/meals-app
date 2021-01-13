import 'package:flutter/material.dart';
import 'package:meals/ui/home/drawer_item.dart';
import 'package:meals/ui/settings/settings_page.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorDark,
            child: Text(
              'Meals App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          DrawerItem(
            'Categories',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/categories'),
          ),
          Divider(),
          DrawerItem(
            'Settings',
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(SettingsPage.path),
          ),
        ],
      ),
    );
  }
}
