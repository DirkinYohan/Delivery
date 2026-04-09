import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';

class CategorySelector extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategorySelector({super.key, required this.onCategorySelected});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                widget.onCategorySelected(categories[index]);
              },
              child: Container(
                width: index == 0 ? 75 : 120,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.gray,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            offset: const Offset(0, 10),
                            blurRadius: 18,
                            spreadRadius: -1,
                          )
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  categories[index],
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isSelected ? AppColors.white : AppColors.textSecondary,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
