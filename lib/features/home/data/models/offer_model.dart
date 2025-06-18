import 'package:hive/hive.dart';
part 'offer_model.g.dart';
@HiveType(typeId: 1)
class OfferModel {
  @HiveField(0)
  String? link;
  OfferModel({
    this.link,
  });
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      link: json['link'] as String?,
    );
  }
}