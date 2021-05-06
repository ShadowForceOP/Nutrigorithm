import 'package:flutter/material.dart';
import 'package:nutrigorithm/ui/widgets/recipe_card.dart';
import 'package:nutrigorithm/model/recipe.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RecipeCard(Recipe("Recipe", 'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c8ffc5bbb3719b5a46ee703acb0a0ac5&auto=format&fit=crop&w=634&q=80',
            RecipeType.breakfast,
            [
              '100g of fresh blueberries',
              '200g of plain yoghurt',
              '100g of milk',
              '1 banana',
            ]),
        ));
  }
// #enddocregion build
}