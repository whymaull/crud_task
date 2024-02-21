// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
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
                              hintText: 'Input Id Produk',
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
                              hintText: 'Input Nama Produk',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Harga',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.salaryTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Harga Produk',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Stok',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.ageTextController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Jumlah ',
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
                        print(controller.salaryTextController.text);
                        print(controller.ageTextController.text);

                        controller.addAcc(
                          controller.idTextController.text,
                          controller.nameTextController.text,
                          controller.salaryTextController.text,
                          controller.ageTextController.text,
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
