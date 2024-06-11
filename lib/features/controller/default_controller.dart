import 'package:design_ui/model/category_model.dart';
import 'package:design_ui/model/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DefaultController extends GetxController {
  //home
  RxInt indexSelectedCategory = 1.obs;
  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: 'All'),
    CategoryModel(id: 2, name: 'Khmer food'),
    CategoryModel(id: 3, name: 'Fast food'),
    CategoryModel(id: 4, name: 'Cakes'),
    CategoryModel(id: 5, name: 'Drinks'),
  ].obs;

  List<Product> dataProduct = [
    //create 5 product
    Product(
        id: 1,
        name: 'Product 1',
        price: 10,
        imageUrl: '',
        description: 'abf',
        categoryId: 2),
    Product(
        id: 2,
        name: 'Product 2',
        price: 20,
        imageUrl: '',
        description: 'abf',
        categoryId: 2),
    Product(
        id: 3,
        name: 'Product 3',
        price: 30,
        imageUrl: '',
        description: 'abf',
        categoryId: 3),
    Product(
        id: 4,
        name: 'Product 4',
        price: 40,
        imageUrl: '',
        description: 'abf',
        categoryId: 2),
    Product(
        id: 5,
        name: 'Product 5',
        price: 50,
        imageUrl: '',
        description: 'abf',
        categoryId: 3),
  ].obs;
  List<Product> filterItemsByCategoryId(int categoryId) {
    return dataProduct
        .where((item) => item.categoryId == categoryId)
        .toList()
        .obs;
  }

  //order
  List<Product> orderProducts = <Product>[].obs;
  List<Product> historyProducts = <Product>[].obs;
}