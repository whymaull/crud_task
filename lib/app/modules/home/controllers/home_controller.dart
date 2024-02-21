// ignore_for_file: avoid_print, unnecessary_overrides

import 'package:crud_task/app/data/models/product.dart';
import 'package:crud_task/app/data/repository/repo_crud.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<ProductElement> listProduct = [];
  RxBool isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getProductList();
    print(listProduct);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future getProductList() async {
    isLoading.value = true;
    final service = repoCRUD();
    listProduct = await service.request();
    isLoading.value = false;
  }

  Future<void> deleteEmployee(String id) async {
    try {
      isLoading.value = true;
      final service = repoCRUD();
      await service.deleteUser(id);
      await getProductList();
    } catch (e) {
      print('Error deleting employee: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
