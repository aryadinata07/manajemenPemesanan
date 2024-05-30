import 'package:angkringan_omaci_ta/app/api/controller/category_controller.dart';
import 'package:angkringan_omaci_ta/app/api/controller/menu_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class EditMenuController extends GetxController {
  final ApiMenuController apiMenuController = Get.put(ApiMenuController());
  final MenuRestoranController menuRestoranController = Get.put(MenuRestoranController());
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  RxList categories = <Categories>[].obs;
  var selectedCategory = SelectedCategory(name: '', id: 0).obs;
  RxBool isNameEmpty = false.obs;
  RxBool isPriceEmpty = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future getCategories() async {
    isLoading.value = true;
    try {
      var categoriesData = await ApiCategoryController().getCategories();
      categories.value = categoriesData;
      print("Get Categories Success MENU RESTORAN CONTROLLER");
      isLoading.value = false;
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  void setSelectedCategory(Categories category) {
    selectedCategory.value = SelectedCategory(name: category.categoryName, id: category.categoryId);
  }

  Future updateMenu(int productId, String? name, double? price, int categoryId) async {
    if (name == null) {
      isNameEmpty.value = true;
      return;
    }

    if (price == null) {
      isPriceEmpty.value = true;
      return;
    }

    if(!isNameEmpty.value && !isPriceEmpty.value){
      String priceStr = price.toStringAsFixed(2);
      String priceBeforeDecimal = priceStr.split('.')[0];

      if (priceBeforeDecimal.length > 6) {
        Get.snackbar(
          "Error",
          "Jumlah digit maksimal untuk Harga adalah 6 atau Rp 999.999",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      try{
        isLoading.value = true;
        await apiMenuController.updateMenu(
          productId,
          name,
          price,
          selectedCategory.value.id,
        );
        if(apiMenuController.isUpdateSuccess.value){
          await menuRestoranController.getMenus();
          isLoading.value = false;
          Get.back();
        }else{
          isLoading.value = false;
          print("ERROR UPDATE MENU CONTROLLER");
          Get.snackbar(
            "Error",
            "Menu gagal di update, silahkan coba lagi",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }catch (e) {
        isLoading.value = false;
        print("ERROR UPDATE MENU CONTROLLER $e");
        Get.snackbar(
          "Error",
          "Menu gagal di update, silahkan coba lagi",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  final int maxLength = 40;
  var currentText = ''.obs;
  void updateText(String text) {
    if (text.length <= maxLength) {
      currentText.value = text;
      isNameEmpty.value = false;
    }
  }

  var hargaMenuError = false.obs;
  void setHargaMenu(String text){
    harga.text = text;
    isPriceEmpty.value = false;
  }

  String extractDigits(String formattedPrice) {
    return formattedPrice.replaceAll(RegExp(r'\D'), '');
  }

  bool validateTextField(){
    bool isValid = true;
    if(currentText.value.isEmpty){
      isNameEmpty.value = true;
      isValid = false;
    }else{
      isNameEmpty.value = false;
    }

    if(harga.text.isEmpty){
      hargaMenuError.value = true;
      isPriceEmpty.value = true;
      isValid = false;
    }else{
      hargaMenuError.value = false;
    }
    return isValid;
  }

  // bool validateFields() {
  //   isNameEmpty.value = nama.text.isEmpty;
  //   isPriceEmpty.value = harga.text.isEmpty;
  //   return !isNameEmpty.value && !isPriceEmpty.value;
  // }

  // var selectedImagePath = ''.obs;
  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImagePath.value = image.path;
  //   }
  // }


}
