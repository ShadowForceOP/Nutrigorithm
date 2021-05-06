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
              recipe.name,
            ),
            // Empty space:
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.timer, size: 20.0),
                SizedBox(width: 5.0)
              ],
            ),
          ],
        ),
      );
    }
    return _buildTitleSection();
  }
}