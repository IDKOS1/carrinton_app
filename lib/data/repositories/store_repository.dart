import 'dart:convert';
import 'package:carrinton_app/domain/entities/store_info_entities/store_detail_entity.dart';
import 'package:carrinton_app/domain/entities/store_info_entities/store_list_entity.dart';
import 'package:carrinton_app/domain/repositories/store_repository.dart';
import 'package:http/http.dart' as http;

class StoreRepositoryImpl implements StoreRepository {
  final String baseUrl = "https://api.example.com";

  @override
  Future<List<StoreListEntity>> getStoreList() async {
    final response = await http.get(Uri.parse('$baseUrl/stores'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => StoreListEntity(
        storeId: data['storeId'],
        title: data['title'],
        location: data['location'],
        number: data['number'],
        operatingTime: data['operatingTime'],
        distance: (data['distance'] as num).toDouble(),
        storeImage: data['storeImage'],
      )).toList();
    } else {
      throw Exception('Failed to load store list');
    }
  }

  @override
  Future<StoreDetailEntity> getStoreDetail(int storeId) async {
    final response = await http.get(Uri.parse('$baseUrl/stores/$storeId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return StoreDetailEntity(
        storeId: data['storeId'],
        title: data['title'],
        location: data['location'],
        number: data['number'],
        price: (data['price'] as num).toDouble(),
        lastVisit: DateTime.parse(data['lastVisit']),
        ownCan: (data['ownCan'] as List<dynamic>).cast<String>(),
        storeImage: data['storeImage'],
      );
    } else {
      throw Exception('Failed to load store detail');
    }
  }
}
