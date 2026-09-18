import 'package:flutter/material.dart';

/// Pastilla de categoría con [ChoiceChip], con estilos propios
/// (selectedColor, labelStyle, shape, side) en vez de depender de
/// ChipThemeData, para conservar el mismo look minimalista de dos tonos.
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
      child: ChoiceChip(
        label: Text(texto),
        selected: seleccionado,
        showCheckmark: false,
        onSelected: (_) => onTap(),
        selectedColor: primary,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: seleccionado ? Colors.white : const Color(0xFF4A4A4A),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.zero,
        shape: const StadiumBorder(),
        side: BorderSide(
          color: seleccionado ? primary : const Color(0xFFE3E5E8),
        ),
      ),
    );
  }
}
