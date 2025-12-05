import 'package:flutter/material.dart';
import 'package:food_cuisine_app/widgets/category_grid.dart';
import '../models/meals.dart';
import '../data/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.onFavouriteToggle});
  void Function(Meal meal) onFavouriteToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: categoriesList
            .map((cat) => CategoryGrid(
                  category: cat,
                  onFavouriteToggle: onFavouriteToggle,
                ))
            .toList(),
      ),
    );
  }
}
