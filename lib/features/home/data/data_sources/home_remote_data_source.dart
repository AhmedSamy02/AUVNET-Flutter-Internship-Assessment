import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/data/models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<NearbyRestaurant>> getNearbyRestaurants();
  Future<List<OfferModel>> getOffers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<NearbyRestaurant>> getNearbyRestaurants() async {
    final id = await GetIt.I.get<FlutterSecureStorage>().read(key: 'token');
    final snapshot = await db.collection('users').doc(id ?? '').get();
    final data = snapshot.data();
    if (data == null || !data.containsKey('nearest_stores')) {
      return [];
    }
    final nearbyRestaurants =
        (data['nearest_stores'] as List<dynamic>).map((restaurant) {
      return NearbyRestaurant.fromJson(restaurant as Map<String, dynamic>);
    }).toList();
    print('Fetched ${nearbyRestaurants.length} nearby restaurants');
    return nearbyRestaurants;
  }

  @override
  Future<List<OfferModel>> getOffers() async {
    final data = await db.collection('offers').get();
    if (data.docs.isEmpty) {
      return [];
    }
    return data.docs.map((doc) {
      return OfferModel.fromJson(doc.data());
    }).toList();
  }
}
