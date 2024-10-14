class CarModel {
  final String brand;
  final String model;
  final String modelUrl;
  final String rating;
  final String rate;

  CarModel(
      {required this.brand,
      required this.model,
      required this.modelUrl,
      required this.rating,
      required this.rate});
}

List<CarModel> cars = [
  CarModel(
    brand: 'Ferrari',
    model: '488 Spider',
    modelUrl: 'assets/ferrari.glb',
    rating: '4.8',
    rate: '5000',
  ),
];
