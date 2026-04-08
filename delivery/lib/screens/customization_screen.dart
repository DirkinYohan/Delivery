import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';
import 'package:delivery/models/burger.dart';
import 'package:delivery/screens/payment_screen.dart';

class CustomizationScreen extends StatefulWidget {
  final Burger burger;

  const CustomizationScreen({super.key, required this.burger});

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  final List<String> toppings = [
    'Tomato',
    'Onion',
    'Pickles',
    'Bacon',
    'Cheese',
  ];
  final List<String> sideOptions = [
    'Fries',
    'Coleslaw',
    'Salad',
    'Onion Rings',
  ];
  final Set<String> selectedToppings = {};
  String? selectedSide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/arrow_left.png',
                        width: 28,
                        height: 28,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/search.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),

              // Burger Image and Title
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      widget.burger.imagePath,
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Customize Your Burger to Your Tastes. Ultimate Experience",
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Toppings Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toppings",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: toppings.map((topping) {
                        final isSelected = selectedToppings.contains(topping);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedToppings.remove(topping);
                              } else {
                                selectedToppings.add(topping);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.gray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              topping,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textMain,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Side Options Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Side options",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sideOptions.length,
                        itemBuilder: (context, index) {
                          final side = sideOptions[index];
                          final isSelected = selectedSide == side;
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () => setState(() => selectedSide = side),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.gray,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  side,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.textMain,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Total and Order
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "\$${widget.burger.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentScreen(total: widget.burger.price),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textMain,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "ORDER NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
