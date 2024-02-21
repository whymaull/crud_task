// ignore_for_file: avoid_print, camel_case_types

import 'package:crud_task/app/data/models/product.dart';
import 'package:crud_task/app/data/models/updateById.dart';
import 'package:dio/dio.dart';

class repoCRUD {
  final dio = Dio();

  Future request() async {
    Response response;
    response = await dio
        .get('https://jgt4wx4c-3000.asse.devtunnels.ms/api/v1/product');
    print(response.data.toString());
    final model = Product.fromJson(response.data);
    if (response.statusCode == 200) {
      print(model.products);
      return model.products;
    } else {
      return print(response.statusCode);
    }
  }

  Future post(int usersId, String name, int price, int stock) async {
    Response response;
    response = await dio.post(
      'https://jgt4wx4c-3000.asse.devtunnels.ms/api/v1/product',
      data: {
        "users_id": usersId,
        "name": name,
        "price": price,
        "stock": stock,
        "status": true,
        "image": "",
      },
    );
    print(response.data.toString());
  }

  Future getById(String id) async {
    Response response;
    response = await dio
        .get('https://jgt4wx4c-3000.asse.devtunnels.ms/api/v1/product/$id');
    print(response.data.toString());
    final model = UpdateById.fromJson(response.data);
    if (response.statusCode == 200) {
      print("berhasil");
      return model.product;
    } else {
      return print(response.statusCode);
    }
  }

  Future update(
      String id, int usersId, String name, int price, int stock) async {
    Response response;
    response = await dio.put(
      'https://jgt4wx4c-3000.asse.devtunnels.ms/api/v1/product/$id',
      data: {
        "_id": id,
        "users_id": usersId,
        "name": name,
        "price": price,
        "stock": stock,
        "status": true,
        "image": "",
      },
    );
    print(response.data.toString());
  }

  Future deleteUser(String id) async {
    Response response;
    response = await dio
        .delete('https://jgt4wx4c-3000.asse.devtunnels.ms/api/v1/product/$id');
    print(response.data.toString());
    if (response.statusCode == 200) {
      return print('Berhasil Hapus');
    } else {
      return print('Gagal Hapus');
    }
  }
}
