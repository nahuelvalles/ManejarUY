import 'package:flutter/material.dart';
import 'pdf_screen.dart';

class ManualIndiceScreen extends StatefulWidget {
  const ManualIndiceScreen({super.key});

  @override
  State<ManualIndiceScreen> createState() => _ManualIndiceScreenState();
}

class _ManualIndiceScreenState extends State<ManualIndiceScreen> {
  final _searchCtrl = TextEditingController();

  // ---------------------------
  // INDICE (según lo que pasaste)
  // ---------------------------
  static const _items = <ManualItem>[
    ManualItem('REGLAMENTACIÓN DE REFERENCIA EN URUGUAY', 5),
    ManualItem('PERMISO DE CONDUCIR', 6),
    ManualItem('CATEGORÍAS DE PERMISOS VIGENTES', 8),
    ManualItem('FACTORES DE RIESGO', 10),
    ManualItem('LA MEDICINA Y LA CONDUCCIÓN', 14),
    ManualItem('ALCOHOL Y CONDUCCIÓN', 16),
    ManualItem('SU VEHÍCULO', 22),
    ManualItem('MOTOS Y SIMILARES', 39),
    ManualItem('LA CONDUCCIÓN', 57),
    ManualItem('BICICLETA', 73),
    ManualItem('CUATRICICLOS', 76),
    ManualItem('EL PEATÓN', 77),
    ManualItem('MEDIO AMBIENTE', 85),
    ManualItem('GENERALIDADES EN LA CONDUCCIÓN', 89),
    ManualItem('LAS LEYES FÍSICAS Y LA VELOCIDAD', 92),
    ManualItem('MANIOBRAS EN GENERAL', 96),
    ManualItem('CONDUCCIÓN EN RUTA', 112),
    ManualItem('¿CÓMO ACTUAR EN CASO DE ACCIDENTE?', 117),
    ManualItem('CONDUCCIÓN ECOLÓGICA', 119),
    ManualItem('GLOSARIO', 122),
    ManualItem('ANEXO - SEÑALES', 124),
  ];

  // Categorías sugeridas
  static const _categorias = <ManualCategoria>[
    ManualCategoria(
      titulo: 'Documentación y normativa',
      keys: ['REGLAMENTACIÓN', 'PERMISO', 'CATEGORÍAS'],
    ),
    ManualCategoria(
      titulo: 'Riesgo, salud y alcohol',
      keys: ['FACTORES', 'MEDICINA', 'ALCOHOL'],
    ),
    ManualCategoria(
      titulo: 'Vehículos y usuarios',
      keys: ['SU VEHÍCULO', 'MOTOS', 'BICICLETA', 'CUATRICICLOS', 'PEATÓN'],
    ),
    ManualCategoria(
      titulo: 'Conducción y maniobras',
      keys: ['LA CONDUCCIÓN', 'GENERALIDADES', 'LEYES FÍSICAS', 'MANIOBRAS', 'RUTA'],
    ),
    ManualCategoria(
      titulo: 'Seguridad, ambiente y anexos',
      keys: ['ACCIDENTE', 'MEDIO AMBIENTE', 'ECOLÓGICA', 'GLOSARIO', 'ANEXO'],
    ),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final q = _searchCtrl.text.trim().toLowerCase();
    final isSearching = q.isNotEmpty;

    final filtered = isSearching
        ? _items.where((it) => it.titulo.toLowerCase().contains(q)).toList()
        : const <ManualItem>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guía Nacional de Conducción'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header + buscador con estilo “card”
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _SearchCard(
                    controller: _searchCtrl,
                    hintText: 'Buscar tema… (ej: alcohol, maniobras, peatón)',
                    onChanged: (_) => setState(() {}),
                    onClear: () {
                      _searchCtrl.clear();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            // Contenido
            Expanded(
              child: isSearching
                  ? _ResultadosBusqueda(
                      items: filtered,
                      onTap: (item) => _openPage(context, item.pagina),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 96),
                      children: [
                        for (final cat in _categorias)
                          _CategoriaCard(
                            titulo: cat.titulo,
                            items: _itemsForCategory(cat),
                            onTap: (item) => _openPage(context, item.pagina),
                          ),
                        const SizedBox(height: 10),

                        // Extra (ver todo) con mismo look
                        _CategoriaCard(
                          titulo: '📋 Mostrar índice completo...',
                          items: _items,
                          initiallyExpanded: false,
                          onTap: (item) => _openPage(context, item.pagina),
                        ),
                      ],
                    ),
            ),

            // Botón fijo
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.menu_book),
                  label: const Text(
                    'Abrir desde el inicio',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => _openPage(context, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ManualItem> _itemsForCategory(ManualCategoria cat) {
    final res = <ManualItem>[];
    for (final it in _items) {
      final upper = it.titulo.toUpperCase();
      if (cat.keys.any((k) => upper.contains(k))) {
        res.add(it);
      }
    }
    return res;
  }

  void _openPage(BuildContext context, int page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PdfScreen(initialPage: page),
      ),
    );
  }
}

// -------------------- UI Widgets (estilo tarjetas) --------------------

class _SearchCard extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const _SearchCard({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final q = controller.text.trim();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outlineVariant.withOpacity(0.6)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: q.isEmpty
                ? null
                : IconButton(
                    onPressed: onClear,
                    icon: const Icon(Icons.close),
                  ),
            border: InputBorder.none, // 🔥 CLAVE
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: false, // 🔥 evita fondo duplicado
          ),
        ),
      ),
    );
  }
}


class _CategoriaCard extends StatelessWidget {
  final String titulo;
  final List<ManualItem> items;
  final bool initiallyExpanded;
  final void Function(ManualItem item) onTap;

  const _CategoriaCard({
    required this.titulo,
    required this.items,
    required this.onTap,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: cs.outlineVariant.withOpacity(0.6)),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 6),
                color: Colors.black.withOpacity(0.04),
              ),
            ],
          ),
          child: Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              childrenPadding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              title: Text(
                titulo,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              children: [
                for (final it in items)
                  _ItemTile(
                    title: it.titulo,
                    page: it.pagina,
                    onTap: () => onTap(it),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  final String title;
  final int page;
  final VoidCallback onTap;

  const _ItemTile({
    required this.title,
    required this.page,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cs.outlineVariant.withOpacity(0.55)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: cs.primary.withOpacity(0.08),
              ),
              child: Text(
                'p. $page',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: cs.onSurface.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }
}

class _ResultadosBusqueda extends StatelessWidget {
  final List<ManualItem> items;
  final void Function(ManualItem item) onTap;

  const _ResultadosBusqueda({
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    if (items.isEmpty) {
      return Center(
        child: Text(
          'No encontré resultados con ese texto.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: cs.onSurface.withOpacity(0.7),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 96),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final it = items[i];

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: cs.outlineVariant.withOpacity(0.6)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                  color: Colors.black.withOpacity(0.04),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              title: Text(
                it.titulo,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text('Página ${it.pagina}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => onTap(it),
            ),
          ),
        );
      },
    );
  }
}

// -------------------- Modelos --------------------

class ManualItem {
  final String titulo;
  final int pagina; // 1-based
  const ManualItem(this.titulo, this.pagina);
}

class ManualCategoria {
  final String titulo;
  final List<String> keys;
  const ManualCategoria({required this.titulo, required this.keys});
}
