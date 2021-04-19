import '../widgets/main_drawer.dart';
import "package:flutter/material.dart";

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactosFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegetarian = widget.currentFilters["vegetarian"];
    _lactosFree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  "gluten": _glutenFree,
                  "lactose": _lactosFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                return widget.saveFilter(selectedFilter);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                "Gluteen Free",
                "Only include gluten free meals",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Lactose Free",
                "Only include lactose free meals",
                _lactosFree,
                (newValue) {
                  setState(() {
                    _lactosFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include Vegetarian meals",
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegan",
                "Only include Vegan meals",
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
