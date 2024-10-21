class ExoticCarModel {
  final String imagePath;
  final String brand;
  final String model;
  final String engine;
  final String maxspeed;
  final String seats;

  const ExoticCarModel({
    required this.imagePath,
    required this.brand,
    required this.model,
    required this.engine,
    required this.maxspeed,
    required this.seats,
  });
}

List<ExoticCarModel> exoticCars = const [
  ExoticCarModel(
    imagePath: 'assets/exotic/bugatti.png',
    brand: 'Koenigsegg',
    model: 'Agera one',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotic/revuelto.png',
    brand: 'Lamborghini',
    model: 'Revuelto',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotic/jesko.png',
    brand: 'Koenigsegg',
    model: 'Agera one',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotic/LA.png',
    brand: 'Koenigsegg',
    model: 'Agera one',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
  ),
  ExoticCarModel(
    imagePath: 'assets/exotic/jesko.png',
    brand: 'Koenigsegg',
    model: 'Agera one',
    engine: 'V12',
    maxspeed: '400',
    seats: '2',
  ),
];
