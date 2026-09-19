import 'package:flutter/material.dart';

import '../data/event_data.dart';
import '../theme/app_theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _maxContentWidth = 1100;

  String categoriaSeleccionada = 'Todos';
  String busqueda = '';
  Set<String> favoritos = {};
  bool soloFavoritos = false;

  @override
  Widget build(BuildContext context) {
    final busquedaNormalizada = busqueda.trim().toLowerCase();

    final eventosMostrados = eventos.where((evento) {
      final coincideCategoria =
          categoriaSeleccionada == 'Todos' ||
          evento['categoria'] == categoriaSeleccionada;
      final coincideBusqueda =
          busquedaNormalizada.isEmpty ||
          evento['titulo'].toString().toLowerCase().contains(
            busquedaNormalizada,
          );
      final coincideFavorito =
          !soloFavoritos || favoritos.contains(evento['titulo']);

      return coincideCategoria && coincideBusqueda && coincideFavorito;
    }).toList();

    final anchoPantalla = MediaQuery.of(context).size.width;
    final anchoEfectivo = anchoPantalla > _maxContentWidth
        ? _maxContentWidth
        : anchoPantalla;
    final columnas = anchoEfectivo >= 1100
        ? 4
        : anchoEfectivo >= 900
        ? 3
        : anchoEfectivo >= 600
        ? 2
        : 1;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.school_outlined,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                'Campus Joel University',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: soloFavoritos
                ? 'Mostrar todos los eventos'
                : 'Mostrar solo favoritos',
            icon: Icon(
              soloFavoritos ? Icons.favorite : Icons.favorite_border,
              color: soloFavoritos ? Colors.redAccent : null,
            ),
            onPressed: () {
              setState(() => soloFavoritos = !soloFavoritos);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Eventos universitarios',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Descubre actividades académicas, culturales y deportivas.',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.event_note,
                            color: Colors.white.withValues(alpha: 0.25),
                            size: 52,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: TextField(
                      onChanged: (valor) => setState(() => busqueda = valor),
                      decoration: const InputDecoration(
                        hintText: 'Buscar evento por nombre...',
                        prefixIcon: Icon(Icons.search, size: 20),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categorias.length,
                        itemBuilder: (context, index) {
                          final categoria = categorias[index];

                          return CategoryChip(
                            texto: categoria,
                            seleccionado: categoriaSeleccionada == categoria,
                            onTap: () {
                              setState(() {
                                categoriaSeleccionada = categoria;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: Text(
                      'Eventos encontrados: ${eventosMostrados.length}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  if (eventosMostrados.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: EmptyState(
                        mensaje: 'No encontramos eventos con ese filtro.',
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      // GridView normal con shrinkWrap (sin scroll propio) para
                      // vivir dentro del scroll único de la Column.
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: eventosMostrados.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columnas,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: columnas == 1 ? 0.85 : 0.72,
                        ),
                        itemBuilder: (context, index) {
                          final evento = eventosMostrados[index];
                          final titulo = evento['titulo'] as String;

                          return EventCard(
                            evento: evento,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Te registraste en "$titulo"'),
                                ),
                              );
                            },
                            esFavorito: favoritos.contains(titulo),
                            onToggleFavorito: () {
                              setState(() {
                                if (favoritos.contains(titulo)) {
                                  favoritos.remove(titulo);
                                } else {
                                  favoritos.add(titulo);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 20),
                    child: Column(
                      children: [
                        const Divider(color: Color(0xFFE3E5E8)),
                        const SizedBox(height: 12),
                        Text(
                          'Campus Joel University',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Dispositivos Móviles · UAA',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
