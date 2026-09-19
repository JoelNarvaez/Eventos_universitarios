import 'package:flutter/material.dart';

/// Tema visual propio de Campus Eventos: paleta acotada, cards planas con
/// borde sutil en vez de sombra, y un color de acento por categoría para
/// dar organización visual sin recargar la interfaz.
class AppTheme {
  static const Color _primary = Color(0xFF264653);
  static const Color _background = Color(0xFFF7F8FA);
  static const Color _border = Color(0xFFE3E5E8);
  static const Color _textPrimary = Color(0xFF1A1A1A);
  static const Color _textSecondary = Color(0xFF6B7280);

  static const Map<String, Color> _categoryColors = {
    'Académicos': Color(0xFF264653),
    'Tecnología': Color(0xFF2A9D8F),
    'Talleres': Color(0xFFB68A2E),
    'Culturales': Color(0xFFF4A261),
    'Deportivos': Color(0xFFE76F51),
    'Voluntariado': Color(0xFF386641),
  };

  static Color colorForCategory(String categoria) =>
      _categoryColors[categoria] ?? _primary;

  static Color get textSecondary => _textSecondary;

  static Color get primary => _primary;

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _background,
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
          color: _textPrimary,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: _textPrimary,
        ),
        bodyMedium: TextStyle(fontSize: 14, height: 1.3, color: _textSecondary),
        labelLarge: TextStyle(fontWeight: FontWeight.w600, color: _textPrimary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.4,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: _border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: _textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.primary),
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
