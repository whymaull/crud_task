// To parse this JSON data, do
//
//     final update = updateFromJson(jsonString);

import 'dart:convert';

Update updateFromJson(String str) => Update.fromJson(json.decode(str));

String updateToJson(Update data) => json.encode(data.toJson());

class Update {
  String status;
  updateProduct product;

  Update({
    required this.status,
    required this.product,
  });

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        status: json["status"],
        product: updateProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product.toJson(),
      };
}

class updateProduct {
  String? id;
  int? usersId;
  String? name;
  int? price;
  int? stock;
  String? status;
  String? imageUrl;

  updateProduct({
    required this.id,
    required this.usersId,
    required this.name,
    required this.price,
    required this.stock,
    required this.status,
    required this.imageUrl,
  });

  factory updateProduct.fromJson(Map<String, dynamic> json) => updateProduct(
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
