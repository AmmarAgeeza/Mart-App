import '../../../../core/utils/app_images.dart';

class ProductModel {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  const ProductModel({
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
      price: '100',
    ),
    ProductModel(
      imageUrl: AppImages.product2,
      name: 'Product 2',
      description: 'Description 2',
      price: '200',
    ),
    ProductModel(
      imageUrl: AppImages.product3,
      name: 'Product 3',
      description: 'Description 3',
      price: '300',
    ),
    ProductModel(
      imageUrl: AppImages.product4,
      name: 'Product 4',
      description: 'Description 4',
      price: '400',
    ),
    ProductModel(
      imageUrl: AppImages.product5,
      name: 'Product 5',
      description: 'Description 5',
      price: '500',
    ),
  ];
}
