import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String status;
  List<Orders> data;

  OrderModel({
    required this.status,
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    status: json["status"],
    data: List<Orders>.from(json["data"].map((x) => Orders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Orders {
  int customer;
  String customerName;
  String customerTotalPrice;
  String customerServe;
  int customerServeId;
  int? customerPayment;
  int? customerOrderStatus;
  int customerTotalProduct;
  String? customerNotes;
  String? customerPhoneNumber;
  DateTime customerOrderDate;
  List<Product> products;

  Orders({
    required this.customer,
    required this.customerName,
    required this.customerTotalPrice,
    required this.customerServe,
    required this.customerServeId,
    this.customerPayment,
    this.customerOrderStatus,
    required this.customerTotalProduct,
    this.customerNotes,
    this.customerPhoneNumber,
    required this.customerOrderDate,
    required this.products,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    customer: json["customer"],
    customerName: json["customer_name"],
    customerTotalPrice: json["customer_total_price"],
    customerServe: json["customer_serve"],
    customerServeId: json["customer_serve_id"],
    customerPayment: json["customer_payment"],
    customerOrderStatus: json["customer_order_status"],
    customerTotalProduct: json["customer_total_product"],
    customerNotes: json["customer_notes"],
    customerPhoneNumber: json["customer_phone_number"],
    customerOrderDate: DateTime.parse(json["customer_order_date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer,
    "customer_name": customerName,
    "customer_total_price": customerTotalPrice,
    "customer_serve": customerServe,
    "customer_serve_id": customerServeId,
    "customer_payment": customerPayment,
    "customer_order_status": customerOrderStatus,
    "customer_total_product": customerTotalProduct,
    "customer_notes": customerNotes,
    "customer_phone_number": customerPhoneNumber,
    "customer_order_date": customerOrderDate.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int productId;
  String productName;
  int quantity;
  String basePrice;

  Product({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.basePrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
    basePrice: json["base_price"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
    "base_price": basePrice,
  };
}
