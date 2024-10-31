import '../../../../core/utils/app_images.dart';

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  CategoryModel({required this.id, required this.name, required this.imageUrl});
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: 'Fruits',
      imageUrl: AppImages.lemon,
    ),
    CategoryModel(
      id: 2,
      name: 'Chicken',
      imageUrl: AppImages.chicken,
    ),
    CategoryModel(
      id: 3,
      name: 'Fish',
      imageUrl: AppImages.fish,
    ),
    CategoryModel(
      id: 4,
      name: 'Cake',
      imageUrl: AppImages.cake,
    ),
  ];
}
