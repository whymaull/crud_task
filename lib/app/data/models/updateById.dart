// To parse this JSON data, do
//
//     final updateById = updateByIdFromJson(jsonString);

import 'dart:convert';

UpdateById updateByIdFromJson(String str) =>
    UpdateById.fromJson(json.decode(str));

String updateByIdToJson(UpdateById data) => json.encode(data.toJson());

class UpdateById {
  String status;
  ProductById product;

  UpdateById({
    required this.status,
    required this.product,
  });

  factory UpdateById.fromJson(Map<String, dynamic> json) => UpdateById(
        status: json["status"],
        product: ProductById.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product.toJson(),
      };
}

class ProductById {
  String id;
  int usersId;
  String name;
  int price;
  int stock;
  bool status;
  String imageUrl;

  ProductById({
    required this.id,
    required this.usersId,
    required this.name,
    required this.price,
    required this.stock,
    required this.status,
    required this.imageUrl,
  });

  factory ProductById.fromJson(Map<String, dynamic> json) => ProductById(
        id: json["_id"],
        usersId: json["users_id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        status: json["status"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "users_id": usersId,
        "name": name,
        "price": price,
        "stock": stock,
        "status": status,
        "image_url": imageUrl,
      };
}
