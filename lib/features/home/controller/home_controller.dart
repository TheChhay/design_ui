import 'package:design_ui/model/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    List<Product> dataProduct = [
    //create 5 product
    Product(id: 1, name: 'Product 1', price: 10000, imageUrl: '',description: 'abf'),
    Product(id: 2, name: 'Product 2', price: 20000, imageUrl: '',description: 'abf'),
    Product(id: 3, name: 'Product 3', price: 30000, imageUrl: '',description: 'abf'),
    Product(id: 4, name: 'Product 4', price: 40000, imageUrl: '',description: 'abf'),
    Product(id: 5, name: 'Product 5', price: 50000, imageUrl: '',description: 'abf'),
  ].obs;
}