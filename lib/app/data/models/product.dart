// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String status;
  List<ProductElement> products;

  Product({
    required this.status,
    required this.products,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json["products"] != null) {
      return Product(
        status: json["status"],
        products: (json["products"] as List<dynamic>)
            .map((x) => ProductElement.fromJson(x))
            .toList(),
      );
    } else {
      return Product(
        status: json["status"],
        products: [],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  String? id;
  int usersId;
  String name;
  int price;
  int stock;
  bool status;
  String imageUrl;

  ProductElement({
    required this.id,
    required this.usersId,
    required this.name,
    required this.price,
    required this.stock,
    required this.status,
    required this.imageUrl,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
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
