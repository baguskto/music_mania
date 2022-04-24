import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mania/app/modules/home/controllers/home_controller.dart';

class HomeSearchBarWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1, color: Colors.white, style: BorderStyle.solid)),
        child: TextField(
          enableSuggestions: false,
          autocorrect: false,
          maxLines: 1,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.name,
          controller: controller.searchTextController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search brand / product / user',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            controller.showPlaylistByArtistSearched(keyword: value);
          },
        ),
      ),
    );
  }
}
