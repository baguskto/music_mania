class SearchResultMusicByArtistModel {
  SearchResultMusicByArtistModel({
    required this.resultCount,
    required this.results,
  });

  int resultCount;
  List<Result> results;

  factory SearchResultMusicByArtistModel.fromMap(Map<String, dynamic> json) =>
      SearchResultMusicByArtistModel(
        resultCount: json['resultCount'],
        results:
        List<Result>.from(json['results'].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    required this.artistId,
    required this.collectionId,
    required this.trackId,
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.artworkUrl60,
    required this.artistViewUrl,
    required this.collectionViewUrl,
    required this.trackViewUrl,
    required this.previewUrl,
  });

  int artistId;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String artistViewUrl;
  String collectionViewUrl;
  String trackViewUrl;
  String previewUrl;
  String artworkUrl60;


  factory Result.fromMap(Map<String, dynamic> json) =>
      Result(
        artistId: json['artistId'],
        collectionId: json['collectionId'],
        trackId: json['trackId'],
        artistName: json['artistName'],
        collectionName: json['collectionName'],
        trackName: json['trackName'],
        artworkUrl60: json['artworkUrl60'],
        artistViewUrl: json['artistViewUrl'],
        collectionViewUrl: json['collectionViewUrl'],
        trackViewUrl: json['trackViewUrl'],
        previewUrl: json['previewUrl'],
      );
}
