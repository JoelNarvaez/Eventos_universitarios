import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Mensaje que reemplaza al grid cuando el buscador, la categoría o el
/// filtro de favoritos no encuentran ningún evento, en vez de dejar la
/// pantalla en blanco.
class EmptyState extends StatelessWidget {
  final String mensaje;

  const EmptyState({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_busy,
              size: 48,
              color: AppTheme.textSecondary,
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
