import 'package:flutter/material.dart';
import 'package:food_cuisine_app/models/meals.dart';
import 'package:food_cuisine_app/ui/meal_details_screen.dart';
import 'package:food_cuisine_app/widgets/meal_meta_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get _complexityToString {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get _affordibilityToString {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _onSelectMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          _onSelectMealItem(
            context,
            meal,
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 8,
                ),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealMetaDtaItem(
                          text: '${meal.duration.toString()} minutes',
                          icon: Icons.schedule,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealMetaDtaItem(
                          text: _complexityToString,
                          icon: Icons.work,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealMetaDtaItem(
                          text: _affordibilityToString,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
