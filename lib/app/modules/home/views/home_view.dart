// ignore_for_file: unrelated_type_equality_checks, prefer_is_empty, prefer_const_constructors

import 'package:crud_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD TASK'),
      ),
      body: Obx(
        () => controller.isLoading != false
            ? const Center(child: CircularProgressIndicator())
            : controller.listProduct.length == 0
                ? Center(
                    child: Text(
                    'data kosong',
                  ))
                : ListView.builder(
                    itemCount: controller.listProduct.length,
                    itemBuilder: (context, index) {
                      final data = controller.listProduct[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Text(data.name),
                            const SizedBox(width: 16),
                            Text('(${data.stock} pcs)')
                          ],
                        ),
                        subtitle: Text('Rp. ${data.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: const Icon(Icons.edit),
                              onTap: () {
                                Get.toNamed(
                                  Routes.EDIT_ACCOUNT,
                                  arguments: data.id,
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {
                                controller.deleteEmployee(data.id!);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
