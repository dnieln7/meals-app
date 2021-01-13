import 'package:flutter/material.dart';

// New widget to use the context an only trigger this build method when theme changes
class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function tabHandler;

  DrawerItem(this.title, this.icon, this.tabHandler);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tabHandler,
      leading: Icon(
        icon,
        size: 25,
        color: Theme.of(context).primaryColorDark,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle,
      ),
    );
  }
}
