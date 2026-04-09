import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';
import 'package:delivery/models/burger.dart';
import 'package:delivery/services/data_service.dart';
import 'package:delivery/widgets/burger_card.dart';
import 'package:delivery/screens/product_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteBurgers = DataService.burgers.where((b) => b.isFavorite).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "My Favorites",
          style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favoriteBurgers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 20),
                  const Text(
                    "No favorites yet",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: favoriteBurgers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final burger = favoriteBurgers[index];
                return BurgerCard(
                  burger: burger,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(burger: burger),
                      ),
                    );
                    setState(() {}); // Refresh when coming back
                  },
                );
              },
            ),
    );
  }
}
