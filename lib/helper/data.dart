import '../model/category_model.dart';

//

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  //1

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/8353835/pexels-photo-8353835.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2

  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //3

  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //4

  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //5

  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/8326316/pexels-photo-8326316.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //6

  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/10512973/pexels-photo-10512973.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //7

  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/2599244/pexels-photo-2599244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categoryModel);

  categoryModel = CategoryModel();

  return category;
}
