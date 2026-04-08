import 'package:flutter/material.dart';
import 'package:delivery/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                    const Text("Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              _buildSettingItem(context, "Account Settings", Icons.person_outline),
              _buildSettingItem(context, "Notifications", Icons.notifications_none),
              _buildSettingItem(context, "Privacy Policy", Icons.privacy_tip_outlined),
              _buildSettingItem(context, "Terms of Service", Icons.description_outlined),
              _buildSettingItem(context, "About Us", Icons.info_outline),
              
              const Spacer(),
              
              // App Version
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, IconData icon) {
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
            Icon(icon, color: AppColors.textMain),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
