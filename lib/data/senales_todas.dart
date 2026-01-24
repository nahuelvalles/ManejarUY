import 'senal_model.dart';
import 'senales_reglamentarias.dart';
import 'senales_preventivas.dart';

const List<Senal> senalesTodas = [
  ...senalesReglamentarias,
  ...senalesPreventivas,
];
