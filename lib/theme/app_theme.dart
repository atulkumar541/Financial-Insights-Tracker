import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6366F1); // Indigo
  static const Color secondaryColor = Color(0xFF10B981); // Teal
  static const Color accentColor = Color(0xFFF59E0B); // Amber
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1F2937);
  static const Color textLight = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color disabledColor = Color(0xFFD1D5DB);

  // Personality Colors
  static const Map<String, Color> personalityColors = {
    'Risk-Averse': Color(0xFF3B82F6), // Blue
    'Impulsive': Color(0xFFEC4899), // Pink
    'Strategic': Color(0xFF10B981), // Green
    'Pragmatic': Color(0xFFF59E0B), // Amber
    'Visionary': Color(0xFF8B5CF6), // Purple
  };

  // Category Colors
  static const Map<String, Color> categoryColors = {
    'Food & Dining': Color(0xFFFF6B6B),
    'Entertainment': Color(0xFF4ECDC4),
    'Shopping': Color(0xFFFFA502),
    'Transportation': Color(0xFF1DD1A1),
    'Utilities': Color(0xFF5F27CD),
    'Subscriptions': Color(0xFF00D2D3),
    'Education': Color(0xFF0984E3),
    'Health': Color(0xFFEA1E63),
    'Savings': Color(0xFF10B981),
    'Other': Color(0xFF95A5A6),
  };

  // Text Styles
  static TextStyle get displayLarge {
    return GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textDark,
    );
  }

  static TextStyle get displayMedium {
    return GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: textDark,
    );
  }

  static TextStyle get headlineLarge {
    return GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: textDark,
    );
  }

  static TextStyle get headlineMedium {
    return GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: textDark,
    );
  }

  static TextStyle get titleLarge {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: textDark,
    );
  }

  static TextStyle get bodyLarge {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: textDark,
    );
  }

  static TextStyle get bodyMedium {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: textDark,
    );
  }

  static TextStyle get bodySmall {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: textLight,
    );
  }

  static TextStyle get labelLarge {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: textDark,
    );
  }

  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: cardBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: textDark),
        titleTextStyle: headlineMedium,
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderColor),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
