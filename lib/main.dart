import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusEventosApp());
}

/// Oculta la barra de scroll visible (Flutter la muestra por default en web
/// y escritorio) para una vista más limpia, sin cambiar el comportamiento
/// de scroll en sí.
class _SinScrollbar extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class CampusEventosApp extends StatelessWidget {
  const CampusEventosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Joel University',
      theme: AppTheme.lightTheme,
      scrollBehavior: _SinScrollbar(),
      home: const HomePage(),
    );
  }
}
