import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mania/app/data/models/models.dart';
import 'package:music_mania/app/modules/home/controllers/home_controller.dart';
import 'package:skeletons/skeletons.dart';

class HomePlaylistItemWidget extends GetView<HomeController> {
  final SearchResultMusicByArtistModel state;

  HomePlaylistItemWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: state.results.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () => controller.playAudio(
                  index: index, url: state.results[index].previewUrl),
              child: Obx(
                () => Card(
                  color: controller.hasSelect.isTrue &&
                          controller.selectedIndexCard.value == index
                      ? Colors.grey
                      : Colors.white,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    leading: Container(
                      height: 60,
                      width: 60,
                      child: CachedNetworkImage(
                        imageUrl: state.results[index].artworkUrl60,
                        placeholder: (context, url) => SkeletonAvatar(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error_outline),
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(state.results[index].trackName),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.results[index].artistName),
                        Text(state.results[index].collectionName),
                      ],
                    ),
                    trailing: Text('Wave'),
                  ),
                ),
              ))),
    );
  }
}
