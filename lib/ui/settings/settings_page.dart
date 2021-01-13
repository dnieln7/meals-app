import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/ui/home/home_drawer.dart';

class SettingsPage extends StatefulWidget {
  static const path = '/settings';

  final Map<String, bool> currentFilters;
  final Function updateFilters;

  SettingsPage(this.currentFilters, this.updateFilters);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool glutenFree;
  bool lactoseFree;
  bool vegetarian;
  bool vegan;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegetarian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              tooltip: 'Apply filters',
              onPressed: () {
                Map<String, bool> filters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegetarian': vegetarian,
                  'vegan': vegan,
                };

                widget.updateFilters(filters);
              },
            ),
          ],
        ),
        drawer: HomeDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  createSwitchOption(
                    'Gluten Free',
                    'Only include gluten free meals',
                    glutenFree,
                    (value) => setState(() => glutenFree = value),
                  ),
                  createSwitchOption(
                    'Lactose Free',
                    'Only include lactose free meals',
                    lactoseFree,
                    (value) => setState(() => lactoseFree = value),
                  ),
                  createSwitchOption(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    vegetarian,
                    (value) => setState(() => vegetarian = value),
                  ),
                  createSwitchOption(
                    'Vegan',
                    'Only include vegan meals',
                    vegan,
                    (value) => setState(() => vegan = value),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget createSwitchOption(title, subtitle, target, function) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: target,
      onChanged: function,
    );
  }
}
