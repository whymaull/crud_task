// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_account_controller.dart';

class EditAccountView extends GetView<EditAccountController> {
  const EditAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading != false
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Id Produk',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.idTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input Id Baru',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Nama Produk',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.nameTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input Nama Baru',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Harga',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.priceTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input Harga Baru',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Stok',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.stockTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Jumlah Stok',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[100],
                      ),
                      onPressed: () async {
                        print(controller.idTextController.text);
                        print(controller.nameTextController.text);
                        print(controller.priceTextController.text);
                        print(controller.stockTextController.text);

                        controller.UpdateProduct(
                          controller.idTextController.text,
                          controller.nameTextController.text,
                          controller.priceTextController.text,
                          controller.stockTextController.text,
                        );
                      },
                      child: const Text('Submit Data'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
