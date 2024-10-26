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
    imagePath: 'assets/exoticCars/agera.png',
    brand: 'Koenigsegg',
    model: 'Agera One',
    engine: '5.0L V8',
    maxspeed: '439',
    seats: '2',
    rate: '10,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exoticCars/rev.png',
    brand: 'Lamborghini',
    model: 'Revuelto',
    engine: '6.5L V12',
    maxspeed: '350',
    seats: '2',
    rate: '9,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exoticCars/chiron.png',
    brand: 'Bugatti',
    model: 'Chiron',
    engine: '8.0L W16',
    maxspeed: '420',
    seats: '2',
    rate: '12,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exoticCars/jesko.png',
    brand: 'Koenigsegg',
    model: 'Jesko',
    engine: '5.0L V8',
    maxspeed: '483+',
    seats: '2',
    rate: '12,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exoticCars/mc.png',
    brand: 'Mclaren',
    model: '765 LT',
    engine: '4.0L V8',
    maxspeed: '330',
    seats: '2',
    rate: '10,000',
  ),
  ExoticCarModel(
    imagePath: 'assets/exoticCars/regera.png',
    brand: 'Koenigsegg',
    model: 'Regera',
    engine: '5.0L V8',
    maxspeed: '403',
    seats: '2',
    rate: '12,000',
  ),
];
