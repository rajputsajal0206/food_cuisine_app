import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_cuisine_app/widgets/category_grid.dart';
import '../utility/utility_constants.dart';
import '../data/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                SystemNavigator.pop(); // go back
              },
            ),
            const SizedBox(width: 4), // 4px space
            const Text(kCategoriesTitle),
          ],
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: categoriesList
            .map((cat) => CategoryGrid(
                  category: cat,
                ))
            .toList(),
      ),
    );
  }
}
