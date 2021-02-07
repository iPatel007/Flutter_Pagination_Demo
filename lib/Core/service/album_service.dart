import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_visitroof_test/Core/utilities/apis.dart';
import 'package:flutter_visitroof_test/Models/album.dart';

abstract class AlbumService {
  Future<List<Album>> getAlbumListBy({@required String userID});
}

class AlbumServiceImpl implements AlbumService {
  final _dio = Dio();
  @override
  Future<List<Album>> getAlbumListBy({@required String userID}) async {
    try {
      Response response = await _dio.get(APIs.albums + userID);
      List<Map<String, dynamic>> _responseList =
          List<Map<String, dynamic>>.from(response.data);
      if (_responseList.isNotEmpty) {
        return _responseList.map((e) => Album.fromJson(e)).toList();
      } else {
        print("Album List is empty");
        return [];
      }
    } catch (e) {
      print("getAlbumList Error: $e");
      return null;
    }
  }
}
