import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFEF2A39);
  static const Color textMain = Color(0xFF3C2F2F);
  static const Color textSecondary = Color(0xFF6A6A6A);
  static const Color background = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFF3F4F6);
  static const Color star = Color(0xFFFF9633);
  static const Color green = Color(0xFF1CC019);
  static const Color white = Colors.white;
  static const Color lightGray = Color(0xFFF5F5F5);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.lobster(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: AppColors.textMain,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.7,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),
      ),
    );
  }
}
