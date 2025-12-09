import 'package:flutter/material.dart';

class FiltersDrawer extends StatelessWidget {
  const FiltersDrawer({
    super.key,
    required this.onDrawerOtionTap,
  });

  final void Function(String identifier) onDrawerOtionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking UP',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            onTap: () {
              onDrawerOtionTap('meals');
            },
            leading: Icon(
              Icons.restaurant,
              size: 48,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            onTap: () {
              onDrawerOtionTap('filters');
            },
            leading: Icon(
              Icons.settings,
              size: 48,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
