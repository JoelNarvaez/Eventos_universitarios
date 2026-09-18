import 'package:flutter/material.dart';

/// Pastilla de categoría hecha con [Material] + [InkWell] en vez de
/// [ChoiceChip]: da control total sobre el color de texto en cada estado
/// (blanco sobre color sólido cuando está seleccionada, gris sobre borde
/// cuando no), que es lo que pide un look minimalista de dos tonos.
class CategoryChip extends StatelessWidget {
  final String texto;
  final bool seleccionado;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.texto,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: seleccionado ? primary : Colors.white,
        shape: StadiumBorder(
          side: BorderSide(
            color: seleccionado ? primary : const Color(0xFFE3E5E8),
          ),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              texto,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: seleccionado ? Colors.white : const Color(0xFF4A4A4A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
