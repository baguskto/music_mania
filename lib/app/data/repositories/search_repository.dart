import 'package:music_mania/app/data/models/models.dart';
import 'package:music_mania/app/data/services/search_service.dart';

class SearchRepository {
  final _searchService = SearchService();

  Future<SearchResultMusicByArtistModel> getPlaylistByArtistSearched(
      {required String keyword}) async {
    String _keyword = keyword.replaceAll(' ', '+').toLowerCase();
    try {
      final response = await _searchService.fetchPlaylistByArtistSearched(_keyword);
      return response;
    } catch (err) {
      rethrow;
    }
  }
}
