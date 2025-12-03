import 'package:flutter/material.dart';
import 'package:food_cuisine_app/models/meals.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Text(meal.title);
  }
}
