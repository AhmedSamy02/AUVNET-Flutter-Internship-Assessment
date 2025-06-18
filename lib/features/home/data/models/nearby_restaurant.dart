import 'package:hive/hive.dart';
part 'nearby_restaurant.g.dart';

@HiveType(typeId: 0)
class NearbyRestaurant {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? link;
  @HiveField(3)
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
