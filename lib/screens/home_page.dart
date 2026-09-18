import 'package:flutter/material.dart';

import '../data/event_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoriaSeleccionada = 'Todos';
  String busqueda = '';

  @override
  Widget build(BuildContext context) {
    final busquedaNormalizada = busqueda.trim().toLowerCase();

    final eventosMostrados = eventos.where((evento) {
      final coincideCategoria = categoriaSeleccionada == 'Todos' ||
          evento['categoria'] == categoriaSeleccionada;
      final coincideBusqueda = busquedaNormalizada.isEmpty ||
          evento['titulo']
              .toString()
              .toLowerCase()
              .contains(busquedaNormalizada);

      return coincideCategoria && coincideBusqueda;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Eventos'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eventos universitarios',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              Text(
                'Descubre actividades académicas, culturales y deportivas.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              TextField(
                onChanged: (valor) => setState(() => busqueda = valor),
                decoration: const InputDecoration(
                  hintText: 'Buscar evento por nombre...',
                  prefixIcon: Icon(Icons.search, size: 20),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
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

              const SizedBox(height: 16),

              Text(
                'Eventos encontrados: ${eventosMostrados.length}',
                style: Theme.of(context).textTheme.labelLarge,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: eventosMostrados.isEmpty
                    ? const EmptyState(
                        mensaje: 'No encontramos eventos con ese filtro.',
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          // Base responsiva sencilla.
                          // El alumno puede modificar estos valores y mejorar
                          // la adaptación a distintos tamaños de pantalla.
                          final columnas = constraints.maxWidth >= 900
                              ? 4
                              : constraints.maxWidth >= 600
                                  ? 3
                                  : 2;

                          return GridView.builder(
                            itemCount: eventosMostrados.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columnas,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                            itemBuilder: (context, index) {
                              final evento = eventosMostrados[index];
                              final titulo = evento['titulo'] as String;

                              return EventCard(
                                evento: evento,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Te registraste en "$titulo"',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
