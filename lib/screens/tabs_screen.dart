import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './category_screen.dart';
import '../widgets/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String, dynamic>> _pages ;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages= [
      {
        'page': CategoriesScreen(),
        'title': 'CATEGORIES',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'YOUR FAVORITES',
      },
    ].toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //for tabs at the top
    /*
     DefaultTabController(
      // initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(

            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );*/
    //for tabs at the bottom
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'].toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Star'),
          )
        ],
      ),
    );
  }
}
