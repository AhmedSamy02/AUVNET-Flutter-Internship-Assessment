class NearbyRestaurant {
  String? id;
  String? name;
  String? link;
  String? timeInMins;
  NearbyRestaurant({
    this.id,
    this.name,
    this.link,
    this.timeInMins = '0',
  });
  factory NearbyRestaurant.fromJson(Map<String, dynamic> json) {
    return NearbyRestaurant(
      id: json['id'] as String?,
      name: json['name'] as String?,
      link: json['link'] as String?,
      timeInMins: json['timeInMins']?.toString() ?? '0',
    );
  }
}
