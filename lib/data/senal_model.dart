enum TipoSenal { reglamentaria, preventiva }

class Senal {
  final String asset;
  final String nombre;
  final TipoSenal tipo;

  const Senal({
    required this.asset,
    required this.nombre,
    required this.tipo,
  });
}
