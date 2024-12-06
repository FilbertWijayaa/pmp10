import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fw/response/product_response.dart';

class ProductRepository{

  Future<ProductResponse> getProducts()async{
    try{
      var response = await Dio().get('https://dummyjson.com/products');
      debugPrint('Product response : ${response.data['products']}');
      return ProductResponse.fromJson(response.data['products']);
    }on DioException catch(e){
      throw Exception(e);
    }
  }
}