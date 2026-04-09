import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';
import 'package:delivery/models/burger.dart';

class BurgerCard extends StatefulWidget {
  final Burger burger;
  final VoidCallback? onTap;

  const BurgerCard({super.key, required this.burger, this.onTap});

  @override
  State<BurgerCard> createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              offset: const Offset(0, 4),
              blurRadius: 19,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Bottom Right Heart Icon
            Positioned(
              bottom: 15,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.burger.isFavorite = !widget.burger.isFavorite;
                  });
                },
                child: Image.asset(
                  widget.burger.isFavorite
                      ? 'assets/icons/heart_filled.png'
                      : 'assets/icons/heart_outline.png',
                  width: 24,
                  height: 24,
                  color: widget.burger.isFavorite ? AppColors.primary : null,
                ),
              ),
            ),

            // Rating
            Positioned(
              bottom: 15,
              left: 15,
              child: Row(
                children: [
                  Image.asset('assets/icons/star.png', width: 16, height: 16),
                  const SizedBox(width: 4),
                  Text(
                    widget.burger.rating,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              ),
            ),

            // Title
            Positioned(
              top: 145,
              left: 15,
              right: 15,
              child: Text(
                widget.burger.name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Yellow Ellipse and Burger Image
            Positioned(
              top: 25,
              right: 15,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3D55A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(
                    widget.burger.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
