import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';
import 'package:delivery/screens/success_screen.dart';

class PaymentScreen extends StatelessWidget {
  final double total;

  const PaymentScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/icons/arrow_left.png', width: 28, height: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Image.asset('assets/icons/search.png', width: 20, height: 20),
                  ],
                ),
              ),
              
              Text("Order summary", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              
              // Order Summary List (Simplified for now)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    _buildSummaryItem("Burger", "\$${total.toStringAsFixed(2)}"),
                    const Divider(),
                    _buildSummaryItem("Delivery Fee", "\$2.00"),
                    const Divider(),
                    _buildSummaryItem("Total", "\$${(total + 2.0).toStringAsFixed(2)}", isBold: true),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              Text("Payment methods", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              
              // Payment Methods
              _buildPaymentMethod(context, "Credit Card", "Visa", Icons.credit_card),
              _buildPaymentMethod(context, "PayPal", "paypal@example.com", Icons.account_balance_wallet),
              _buildPaymentMethod(context, "Google Pay", "Google Pay", Icons.payment),
              
              const Spacer(),
              
              // Pay Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    "Pay \$${(total + 2.0).toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context, String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
