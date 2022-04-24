import 'dart:convert';

import 'package:get/get.dart';
import 'package:music_mania/app/data/models/models.dart';

import '../../utils/deafult.exception.dart';

class SearchService {
  final _connect = Get.find<GetConnect>();

  Future<SearchResultMusicByArtistModel> fetchPlaylistByArtistSearched(
      String keyword) async {
    final response = await _connect
        .get('search?term=$keyword&entity=musicTrack', decoder: (value) {
      Map musics = json.decode(value);

      return SearchResultMusicByArtistModel.fromMap(
          musics as Map<String, dynamic>);
    });

    if (!response.hasError) {
      return response.body!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: 'Error');
      }
    }
  }
}
