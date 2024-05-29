import 'package:angkringan_omaci_ta/app/api/controller/category_model.dart';
import 'package:angkringan_omaci_ta/app/api/controller/menu_controller.dart';
import 'package:angkringan_omaci_ta/app/api/models/category_model.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahMenuController extends GetxController {
  final ApiMenuController apiMenuController = Get.put(ApiMenuController());
  final MenuRestoranController menuRestoranController = Get.put(MenuRestoranController());
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  RxList categories = <Categories>[].obs;
  var selectedCategory = SelectedCategory(name: 'Makanan', id: 1).obs;
  RxBool isNamaValid = true.obs;
  RxBool isHargaValid = true.obs;
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

  Future addMenu(String? name, double? price, int categoryId) async {
      if (name == null) {
        isNamaValid.value = false;
        return;
      }

      if (price == null) {
        isHargaValid.value = false;
        return;
      }

      if(isNamaValid.value && isHargaValid.value){
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
          await apiMenuController.addMenu(
            name,
            price,
            selectedCategory.value.id,
          );
          if(apiMenuController.isAddSuccess.value){
            await menuRestoranController.getMenus();
            isLoading.value = false;
            Get.back();
          }else{
            isLoading.value = false;
            print("ERROR TAMBAH MENU CONTROLLER");
            Get.snackbar(
              "Error",
              "Menu gagal di tambah, silahkan coba lagi",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }catch (e) {
          isLoading.value = false;
          print("ERROR TAMBAH MENU CONTROLLER $e");
          Get.snackbar(
            "Error",
            "Menu gagal di tambah, silahkan coba lagi",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
  }

  final int maxLength = 40;
  var currentText = ''.obs;
  var namaMenu = ''.obs;
  var namaMenuError = false.obs;
  void updateText(String text) {
    if (text.length <= maxLength) {
      currentText.value = text;
      namaMenu.value = text;
      isNamaValid.value = true;
    }
  }
  var hargaMenu = ''.obs;
  var hargaMenuError = false.obs;
  void setHargaMenu(String text){
    hargaMenu.value = text;
    isHargaValid.value = true;
  }

  bool validateTextField(){
    bool isValid = true;
    if(namaMenu.value.isEmpty){
      namaMenuError.value = true;
      isNamaValid.value = false;
      isValid = false;
    }else{
      namaMenuError.value = false;
    }

    if(hargaMenu.value.isEmpty){
      hargaMenuError.value = true;
      isHargaValid.value = false;
      isValid = false;
    }else{
      hargaMenuError.value = false;
    }
    return isValid;
  }

  // var selectedImagePath = ''.obs;
  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImagePath.value = image.path;
  //   }
  // }
}