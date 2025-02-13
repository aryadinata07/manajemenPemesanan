import 'package:angkringan_omaci_ta/app/global_components/appbar_owner.dart';
import 'package:angkringan_omaci_ta/app/global_components/background.dart';
import 'package:angkringan_omaci_ta/app/global_components/menu_restoran.dart';
import 'package:angkringan_omaci_ta/app/global_components/sidebar/sidebar_view.dart';
import 'package:angkringan_omaci_ta/app/pages/RoleOwner/menurestoran/menurestoran_controller.dart';
import 'package:angkringan_omaci_ta/common/helper/themes.dart';
import 'package:angkringan_omaci_ta/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuRestoranView extends StatelessWidget {
  MenuRestoranView({super.key});
  final controller = Get.put(MenuRestoranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(),
      drawer: CustomDrawer(),
      body: BackgroundWidget(
        child: GetBuilder<MenuRestoranController>(
          builder: (controller) {
            return SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          context: context,
                          title: 'Menu Restoran',
                        ),
                        // search
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    onChanged: (value) {
                                      controller.searchMenus(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Cari Menu',
                                      hintStyle: const TextStyle(
                                        color: grey,
                                      ),
                                      filled: true,
                                      fillColor: textFieldBackground,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: grey,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: primaryAccent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.filter_list,
                                    color: white,
                                  ),
                                  onPressed: () {
                                    showFilterBottomSheet(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 220,
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return ListView.builder(
                                itemCount: controller.filteredMenus.length,
                                itemBuilder: (context, index) {
                                  final menu = controller.filteredMenus[index];
                                  return MenuRestoranWidget(
                                    name: menu.productName,
                                    category: menu.productCategory,
                                    price: controller.formatPrice(menu.productPrice),
                                    productId: menu.productId,
                                    productCategoryId: menu.productCategoryId,
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
      backgroundColor: primaryAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        Get.toNamed(Routes.TAMBAH_MENU);
      },
      child: const Icon(Icons.add, color: Colors.white, size: 35),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(

          decoration: const BoxDecoration(
            color: background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: const EdgeInsets.all(20),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter by Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.categories.length + 1,
                  itemBuilder: (context, index) {
                    if(index == 0){
                      return ListTile(
                        tileColor: background, // Tile background color
                        textColor: white, // Text color
                        title: const Text(
                          'Semua Kategori',
                        ),
                        onTap: () {
                          controller.clearFilters();
                          Navigator.pop(context);
                        },
                      );
                    }
                    final category = controller.categories[index - 1];
                    return ListTile(
                      tileColor: background, // Tile background color
                      textColor:white, // Text color
                      title: Text(
                        category.categoryName,
                      ),
                      onTap: () {
                        controller.filterMenusByCategory(category.categoryId);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
