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
  int portionCount = 2;
  double spicyValue = 0.7; // Nivel de picante inicial similar a la imagen

  final List<Map<String, String>> toppings = [
    {'name': 'Tomato', 'image': 'assets/images/burger_1.png'},
    {'name': 'Onions', 'image': 'assets/images/burger_2.png'},
    {'name': 'Pickles', 'image': 'assets/images/burger_3.png'},
    {'name': 'Bacons', 'image': 'assets/images/burger_4.png'},
  ];

  final List<Map<String, String>> sideOptions = [
    {'name': 'Fries', 'image': 'assets/images/burger_5.png'},
    {'name': 'Coleslaw', 'image': 'assets/images/burger_1.png'},
    {'name': 'Salad', 'image': 'assets/images/burger_2.png'},
    {'name': 'Onion', 'image': 'assets/images/burger_3.png'},
  ];

  final Set<String> selectedToppings = {'Tomato', 'Onions'};
  final Set<String> selectedSides = {'Fries'};

  double get totalPrice {
    // Precio base del burger * cantidad + extras (simulado $1 por topping/side extra)
    double base = widget.burger.price * portionCount;
    double extras = (selectedToppings.length + selectedSides.length) * 1.0;
    return base + extras;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textMain,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Icon(Icons.search, color: AppColors.textMain, size: 28),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Section: Burger and Controls
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Exploded Burger Image
                          Expanded(
                            flex: 11,
                            child: Image.asset(
                              'assets/images/product_detail_burger.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Controls Column
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textMain,
                                      height: 1.4,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Customize ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            "Your Burger to Your Tastes. Ultimate Experience",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 35),
                                // Spicy Slider
                                const Text(
                                  "Spicy",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textMain,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 4,
                                    activeTrackColor: AppColors.primary,
                                    inactiveTrackColor: Colors.grey[200],
                                    thumbColor: AppColors.primary,
                                    overlayColor: AppColors.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 7,
                                    ),
                                    trackShape:
                                        const RoundedRectSliderTrackShape(),
                                  ),
                                  child: Slider(
                                    value: spicyValue,
                                    onChanged: (val) =>
                                        setState(() => spicyValue = val),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mild",
                                      style: TextStyle(
                                        color: Colors.green[400],
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Hot",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                // Portion Selector
                                const Text(
                                  "Portion",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textMain,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    _buildPortionBtn(Icons.remove, () {
                                      if (portionCount > 1)
                                        setState(() => portionCount--);
                                    }),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        portionCount.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    _buildPortionBtn(
                                      Icons.add,
                                      () => setState(() => portionCount++),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Toppings Section
                    _buildSectionTitle("Toppings"),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 25),
                        itemCount: toppings.length,
                        itemBuilder: (context, index) {
                          final item = toppings[index];
                          return _buildIngredientCard(
                            item,
                            selectedToppings.contains(item['name']),
                            (name) {
                              setState(() {
                                if (selectedToppings.contains(name)) {
                                  selectedToppings.remove(name);
                                } else {
                                  selectedToppings.add(name);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Side options Section
                    _buildSectionTitle("Side options"),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 25),
                        itemCount: sideOptions.length,
                        itemBuilder: (context, index) {
                          final item = sideOptions[index];
                          return _buildIngredientCard(
                            item,
                            selectedSides.contains(item['name']),
                            (name) {
                              setState(() {
                                if (selectedSides.contains(name)) {
                                  selectedSides.remove(name);
                                } else {
                                  selectedSides.add(name);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Bottom Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "\$ ",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: totalPrice.toStringAsFixed(2),
                              style: const TextStyle(
                                color: AppColors.textMain,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentScreen(total: totalPrice),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Text(
                        "ORDER NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textMain,
        ),
      ),
    );
  }

  Widget _buildPortionBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildIngredientCard(
    Map<String, String> item,
    bool isSelected,
    Function(String) onToggle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Image Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(item['image']!, fit: BoxFit.contain),
              ),
            ),
            // Bottom Bar
            GestureDetector(
              onTap: () => onToggle(item['name']!),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF332D2D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isSelected ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 12,
                      ),
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
