import 'package:flutter/material.dart';
import 'package:nutrigorithm/ui/widgets/recipe_card.dart';
import 'package:nutrigorithm/model/recipe.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Cards'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // BUTTON !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              Padding (
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child:  RecipeCard(Recipe("Recipe", 'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c8ffc5bbb3719b5a46ee703acb0a0ac5&auto=format&fit=crop&w=634&q=80',
                    RecipeType.breakfast,
                    [
                      '100g of fresh blueberries',
                      '200g of plain yoghurt',
                      '100g of milk',
                      '1 banana',
                    ]),
                )
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("test2"),
                ),
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {
                  },
                  child: Text("test3"),
                ),
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("test4"),
                ),
              ),
            ],
          ), ),
      ),
    );
  }
}
