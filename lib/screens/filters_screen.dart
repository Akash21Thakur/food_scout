import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  var saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegatarian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  initState() {
    _glutenFree=widget.currentFilters['gluten'] as bool;
    _lactosefree=widget.currentFilters['lactose'] as bool;
    _vegan=widget.currentFilters['vegan'] as bool;
    _vegatarian=widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String decscription,
    bool currentValue,
    var updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(decscription),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR FILTERS '),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegatarian
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'GLUTEN-FREE',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'LACTOSE-FREE',
                  'Only include lactose-free meals',
                  _lactosefree,
                  (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'VEGAN',
                  'Only include vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'VEGATARIAN',
                  'Only include vegetarian meals',
                  _vegatarian,
                  (newValue) {
                    setState(() {
                      _vegatarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
