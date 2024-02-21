// ignore_for_file: unused_local_variable, unnecessary_overrides

import 'package:crud_task/app/data/repository/repo_crud.dart';
import 'package:crud_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  RxBool isLoading = false.obs;
  var idTextController = TextEditingController();
  var nameTextController = TextEditingController();
  var salaryTextController = TextEditingController();
  var ageTextController = TextEditingController();

  void addAcc(String usersId, String name, String price, String stock) async {
    isLoading.value = true;
    final service = repoCRUD();
    bool? isService = await service.post(
        int.parse(usersId), name, int.parse(price), int.parse(stock));

    idTextController = TextEditingController();
    nameTextController = TextEditingController(text: "");
    salaryTextController = TextEditingController();
    ageTextController = TextEditingController();
    isLoading.value = false;
    Get.offAllNamed(Routes.HOME);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
