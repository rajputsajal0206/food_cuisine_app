import 'package:flutter/material.dart';
import 'package:food_cuisine_app/models/meals.dart';
import 'package:food_cuisine_app/widgets/meal_items.dart';

import 'meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, required this.title, required this.categoryMeals});

  final List<Meal> categoryMeals;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return categoryMeals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Uh oh... Nothing To Show You Here.',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Try Some Other Category',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                )
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: categoryMeals[index],
              ),
            ),
          );
  }
}
