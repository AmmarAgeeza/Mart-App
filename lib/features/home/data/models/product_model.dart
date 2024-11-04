import '../../../../core/utils/app_images.dart';

class ProductModel {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final String rating;
  final String noOfRating;

  const ProductModel({
    required this.rating,
    required this.noOfRating,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
  static const List<ProductModel> products = [
    ProductModel(
      imageUrl: AppImages.product1,
      name: 'Product 1',
      description: 'Description 1',
      price: '100 L.E',
      rating: '4.5',
      noOfRating: '12 Rating'
    ),
    ProductModel(
      imageUrl: AppImages.product2,
      name: 'Product 2',
      description: 'Description 2',
      price: '200 L.E',
      rating: '4.0',
      noOfRating: '10 Rating'
    ),
    ProductModel(
      imageUrl: AppImages.product3,
      name: 'Product 3',
      description: 'Description 3',
      price: '300 L.E',
      rating: '3.5',
      noOfRating: '8 Rating'
    ),
    ProductModel(
      imageUrl: AppImages.product4,
      name: 'Product 4',
      description: 'Description 4',
      price: '400 L.E',
      rating: '5.0',
      noOfRating: '15 Rating'
    ),
    ProductModel(
      imageUrl: AppImages.product5,
      name: 'Product 5',
      description: 'Description 5',
      price: '500 L.E',
      rating: '3.0',
      noOfRating: '5 Rating'
    ),
  ];
}
