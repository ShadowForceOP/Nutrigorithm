import 'package:flutter/material.dart';

import 'package:nutrigorithm/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard(this.recipe);

  Widget build(BuildContext context) {
    Padding _buildTitleSection() {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          // Default value for crossAxisAlignment is CrossAxisAlignment.center.
          // We want to align title and description of recipes left:
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                recipe.name, style: TextStyle(fontSize: 16.0,)
            ),
            // Empty space:
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(width: 5.0)
              ],
            ),
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: () => print("Tapped!"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(
                      recipe.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              _buildTitleSection(),
            ],
          ),
        ),
      ),
    );
  }
}