class CarModel {
  final String brand;
  final String model;
  final String modelUrl;
  final String model3dUrl;
  final String rating;
  final String rate;

  CarModel({
    required this.brand,
    required this.model,
    required this.modelUrl,
    required this.model3dUrl,
    required this.rating,
    required this.rate,
  });
}

List<CarModel> cars = [
  CarModel(
    brand: 'Ferrari',
    model: '488 Pista Spider',
    modelUrl: 'assets/cars/spider.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.9',
    rate: '6000',
  ),
  CarModel(
    brand: 'Ford',
    model: 'Mustang',
    modelUrl: 'assets/cars/mustang.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.7',
    rate: '3000',
  ),
  CarModel(
    brand: 'Lamborghini',
    model: 'Huracan',
    modelUrl: 'assets/cars/huracan.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.8',
    rate: '6000',
  ),
  CarModel(
    brand: 'Lamborghini',
    model: 'Urus',
    modelUrl: 'assets/cars/urus.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.7',
    rate: '5000',
  ),
  CarModel(
    brand: 'BMW',
    model: 'M4',
    modelUrl: 'assets/cars/M4.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.9',
    rate: '3000',
  ),
  CarModel(
    brand: 'Lamborghini',
    model: 'LP 740',
    modelUrl: 'assets/cars/lp740.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.9',
    rate: '5000',
  ),
  CarModel(
    brand: 'Mercedes',
    model: 'C63',
    modelUrl: 'assets/cars/C63.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.7',
    rate: '2000',
  ),
  CarModel(
    brand: 'Porsche',
    model: '911 Carrera',
    modelUrl: 'assets/cars/911.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.8',
    rate: '4000',
  ),
  CarModel(
    brand: 'Audi',
    model: 'RS5',
    modelUrl: 'assets/cars/rs5.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.7',
    rate: '3000',
  ),
  CarModel(
    brand: 'Chevrolet',
    model: 'Corvette Z06',
    modelUrl: 'assets/cars/z06.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.6',
    rate: '2000',
  ),
  CarModel(
    brand: 'Honda',
    model: 'Civic Type R',
    modelUrl: 'assets/cars/typeR.png',
   model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.5',
    rate: '2000',
  ),
  CarModel(
    brand: 'Chevrolet',
    model: 'Corvette',
    modelUrl: 'assets/cars/corvette.png',
    model3dUrl: 'assets/3Dmodels/ferrari.glb',
    rating: '4.8',
    rate: '4000',
  ),
];
