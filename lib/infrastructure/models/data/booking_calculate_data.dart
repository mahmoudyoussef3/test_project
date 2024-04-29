import 'service_data.dart';

class BookingCalculateData {
  bool? status;
  String? startDate;
  String? endDate;
  int? price;
  int? totalPrice;
  int? totalDiscount;
  int? totalCommissionFee;
  int? totalServiceFee;
  int? couponPrice;
  int? rate;
  List<CalculateItem>? items;

  BookingCalculateData({
    this.status,
    this.startDate,
    this.endDate,
    this.price,
    this.totalPrice,
    this.totalDiscount,
    this.totalCommissionFee,
    this.totalServiceFee,
    this.couponPrice,
    this.rate,
    this.items,
  });

  BookingCalculateData copyWith({
    bool? status,
    String? startDate,
    String? endDate,
    int? price,
    int? totalPrice,
    int? totalDiscount,
    int? totalCommissionFee,
    int? totalServiceFee,
    int? couponPrice,
    int? rate,
    List<CalculateItem>? items,
  }) =>
      BookingCalculateData(
        status: status ?? this.status,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        totalCommissionFee: totalCommissionFee ?? this.totalCommissionFee,
        totalServiceFee: totalServiceFee ?? this.totalServiceFee,
        couponPrice: couponPrice ?? this.couponPrice,
        rate: rate ?? this.rate,
        items: items ?? this.items,
      );

  factory BookingCalculateData.fromJson(Map<String, dynamic> json) => BookingCalculateData(
    status: json["status"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    price: json["price"],
    totalPrice: json["total_price"],
    totalDiscount: json["total_discount"],
    totalCommissionFee: json["total_commission_fee"],
    totalServiceFee: json["total_service_fee"],
    couponPrice: json["coupon_price"],
    rate: json["rate"],
    items: json["items"] == null ? [] : List<CalculateItem>.from(json["items"]!.map((x) => CalculateItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "start_date": startDate,
    "end_date": endDate,
    "price": price,
    "total_price": totalPrice,
    "total_discount": totalDiscount,
    "total_commission_fee": totalCommissionFee,
    "total_service_fee": totalServiceFee,
    "coupon_price": couponPrice,
    "rate": rate,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class CalculateItem {
  ServiceData? serviceMaster;
  int? serviceFee;
  String? startDate;
  String? endDate;
  List<String>? errors;

  CalculateItem({
    this.serviceMaster,
    this.serviceFee,
    this.startDate,
    this.endDate,
    this.errors,
  });

  CalculateItem copyWith({
    ServiceData? serviceMaster,
    int? serviceFee,
    String? startDate,
    String? endDate,
    List<String>? errors,
  }) =>
      CalculateItem(
        serviceMaster: serviceMaster ?? this.serviceMaster,
        serviceFee: serviceFee ?? this.serviceFee,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        errors: errors ?? this.errors,
      );

  factory CalculateItem.fromJson(Map<String, dynamic> json) => CalculateItem(
    serviceMaster: json["service_master"] == null ? null : ServiceData.fromJson(json["service_master"]),
    serviceFee: json["service_fee"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "service_master": serviceMaster?.toJson(),
    "service_fee": serviceFee,
    "start_date": startDate,
    "end_date": endDate,
    "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
  };
}