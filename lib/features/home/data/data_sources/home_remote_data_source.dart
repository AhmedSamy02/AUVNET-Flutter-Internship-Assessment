import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';

abstract class HomeRemoteDataSource {
  Future<List<NearbyRestaurant>> getNearbyRestaurants();
  Future<List<String>> getOffers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<NearbyRestaurant>> getNearbyRestaurants() async {
    final id = await GetIt.I.get<FlutterSecureStorage>().read(key: 'id');
    final data = await db.collection('users').where('id', isEqualTo: id).get();
    if (data.docs.isEmpty) {
      return [];
    }
    final userData = data.docs.first.data();
    final nearbyRestaurants = userData['nearbyRestaurants'] as List<dynamic>;
    return nearbyRestaurants.map((restaurant) {
      return NearbyRestaurant.fromJson(restaurant as Map<String, dynamic>);
    }).toList();
  }

  @override
  Future<List<String>> getOffers() async {
    final data = await db.collection('offers').get();
    if (data.docs.isEmpty) {
      return [];
    }
    return data.docs.map((doc) {
      return doc.data()['link'] as String;
    }).toList();
  }
}
