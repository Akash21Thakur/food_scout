import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
 final List<Meal> favoriteMeals;
 FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return Center(
        child: Text('YOU HAVE NO FAVORITES YET...! \n\t\t\t\t\t\tSTART ADDING SOME.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepPurple),),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,

          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
