import 'package:flutter/material.dart';
import 'package:food_cuisine_app/models/meals.dart';
import 'package:food_cuisine_app/ui/categories.dart';
import 'meals_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Meal> _favouriteMeal = [];
  int currentTab = 0;
  void _toggleFavouriteStae(Meal meal) {
    final isMealAvailable = _favouriteMeal.contains(meal);

    if (isMealAvailable) {
      setState(() {
        _favouriteMeal.remove(meal);
      });
    } else {
      setState(() {
        _favouriteMeal.add(meal);
      });
    }
  }

  void indexCounter(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = 'Categories';
    Widget activeWidget = CategoriesScreen(
      onFavouriteToggle: _toggleFavouriteStae,
    );

    if (currentTab == 1) {
      activeWidget = MealsScreen(
        categoryMeals: _favouriteMeal,
        onFavouriteToggle: _toggleFavouriteStae,
      );
      appBarTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
      ),
      body: activeWidget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            indexCounter(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourites',
            )
          ]),
    );
  }
}
