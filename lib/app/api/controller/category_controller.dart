import 'dart:convert';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:angkringan_omaci_ta/app/api/constant/url.dart';

class ApiCategoryController {
  var isSuccess = false.obs;

  Future getCategories() async {
    try{
      final response = await http.get(Uri.parse('$url/category'));
      final jsonResponse = json.decode(response.body);
      print("CATEGORY: $jsonResponse");
      isSuccess = true.obs;
      print("Get Success API CONTROLLER");
      return CategoryModel.fromJson(jsonResponse).data;
    }catch (e){
      isSuccess = false.obs;
      print('Error while fetching categories: $e');
    }
  }


}

class SelectedCategory {
  String name;
  int id;

  SelectedCategory({required this.name, required this.id});
}
