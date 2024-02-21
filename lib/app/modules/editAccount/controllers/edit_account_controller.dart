// ignore_for_file: unused_local_variable, avoid_print, unnecessary_overrides

import 'package:crud_task/app/data/models/updateById.dart';
import 'package:crud_task/app/data/repository/repo_crud.dart';
import 'package:crud_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController {
  ProductById? product;
  RxBool isLoading = false.obs;
  var idTextController = TextEditingController();
  var nameTextController = TextEditingController();
  var priceTextController = TextEditingController();
  var stockTextController = TextEditingController();

  void UpdateProduct(
      String usersId, String name, String price, String stock) async {
    isLoading.value = true;
    final service = repoCRUD();
    bool? isService = await service.update(product!.id, int.parse(usersId),
        name, int.parse(price), int.parse(stock));

    idTextController = TextEditingController();
    nameTextController = TextEditingController();
    priceTextController = TextEditingController();
    stockTextController = TextEditingController();
    isLoading.value = false;
    Get.offAllNamed(Routes.HOME);
  }

  Future getDetailEmployee(String id) async {
    isLoading.value = true;
    final service = repoCRUD();
    product = await service.getById(id);
    print(product?.name);
    nameTextController = TextEditingController(text: product?.name);
    priceTextController = TextEditingController(text: "${product?.price}");
    stockTextController = TextEditingController(text: "${product?.stock}");

    isLoading.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDetailEmployee(Get.arguments);
    print(product);
    print(Get.arguments);
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
}
