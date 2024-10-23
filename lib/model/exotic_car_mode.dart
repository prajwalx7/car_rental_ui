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
      imagePath: 'assets/exotic/bugatti.png',
      brand: 'Bugatti',
      model: 'Chiron',
      engine: 'V12',
      maxspeed: '400',
      seats: '2',
      rate: '10,000'),
  ExoticCarModel(
      imagePath: 'assets/exotic/bugatti.png',
      brand: 'Koenigsegg',
      model: 'Agera one',
      engine: 'V12',
      maxspeed: '400',
      seats: '2',
      rate: '10,000'),
  ExoticCarModel(
      imagePath: 'assets/exotic/bugatti.png',
      brand: 'Koenigsegg',
      model: 'Agera one',
      engine: 'V12',
      maxspeed: '400',
      seats: '2',
      rate: '10,000'),
];
