import 'package:monarch_mart/model/add_to_cart_model.dart';
import 'package:monarch_mart/model/cartmodel.dart';
import 'package:monarch_mart/model/categorymodel.dart';
import 'package:monarch_mart/model/home_page_image.dart';
import 'package:monarch_mart/model/login_user_input.dart';
import 'package:monarch_mart/model/product_model.dart';
import 'package:monarch_mart/model/signup_user_input.dart';
import 'package:monarch_mart/model/authmodel.dart';
import 'package:monarch_mart/services/products_services.dart';

class ProductRepositories {
  ProductServices productServices = ProductServices();

  Future<ProductModel> getProductData() async {
    final response = await productServices.getProductResponse();
    var data = ProductModel.fromJson(response);
    return data;
  }

  Future<HomePageImageModel> getHomeimageData() async {
    final response = await productServices.getHomepageAPiResponse();
    var data = HomePageImageModel.fromJson(response);
    return data;
  }


  Future<ProductModel> getSearchProduct(value) async {
    final response = await productServices.getProductSearchResponse(value);
    var data = ProductModel.fromJson(response);
    return data;
  }

  Future<CategoryModel> getCategoryData() async {
    final response = await productServices.getCategoryResponse();
    var data = CategoryModel.fromJson(response);
    return data;
  }

  Future<CartModel> getCartData() async {
    final response = await productServices.getCart();
    var data = CartModel.fromJson(response);
    return data;
  }

  Future<void> addToCartData(AddToCartModel addToCartModel) async {
     await productServices.addToCart(addToCartModel);

  }

  Future<void> removeCartData(id) async {
    final response = await productServices.removeCart(id);
    if (response == 200) {
      print("Data is remove");
    } else {
      print(response);
    }
  }

  Future<AuthModel> signupData(SignupUserInput signupUserInput) async {
    final response = await productServices.signup(signupUserInput);
    var data = AuthModel.fromJson(response);
    return data;
  }

  Future<AuthModel> signinData(LoginUserInput loginUserInput) async {
    final response = await productServices.signin(loginUserInput);
    var data = AuthModel.fromJson(response);
    return data;
  }
}
