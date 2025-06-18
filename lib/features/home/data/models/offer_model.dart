class OfferModel {
  String? id;
  String? link;
  OfferModel({
    this.id,
    this.link,
  });
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] as String?,
      link: json['link'] as String?,
    );
  }
}