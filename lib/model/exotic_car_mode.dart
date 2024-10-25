class ExoticCarModel {
  final String imagePath;
  final String brand;
  final String model;
  final String engine;
  final String maxspeed;
  final String seats;
  final String rate;

  const ExoticCarModel({
    required this.imagePath,
    required this.brand,
    required this.model,
    required this.engine,
    required this.maxspeed,
    required this.seats,
    required this.rate,
  });
}

List<ExoticCarModel> exoticCars = const [
  ExoticCarModel(
    imagePath: 'assets/exotciCars/agera.png',
    brand: 'Koenigsegg',
    model: 'Agera One',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
    rate: '12,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotciCars/jesko.png',
    brand: 'Koenigsegg',
    model: 'Agera One',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
    rate: '12,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotciCars/mc.png',
    brand: 'Koenigsegg',
    model: 'Agera One',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
    rate: '12,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotciCars/regera.png',
    brand: 'Koenigsegg',
    model: 'Agera One',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
    rate: '12,000',
  ),
];
