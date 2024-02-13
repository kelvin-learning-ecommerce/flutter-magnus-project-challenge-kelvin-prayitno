import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';

import '../../domain/models/response/game_detail_response.dart';
import '../widgets/cached_network_image_utils.dart';

class InfoTab extends StatelessWidget {
  final GameDetailResponse detail;

  InfoTab({Key? key, required this.detail}) : super(key: key);

  var genre = '';
  var platform = '';
  var publisher = '';
  var developer = '';

  @override
  Widget build(BuildContext context) {
    detail.genres?.forEach((element) {
      genre += "${element.name}, ";
    });

    detail.platforms?.forEach((element) {
      platform += "${element.platform?.name}, ";
    });

    detail.publishers?.forEach((element) {
      publisher += "${element.name}, ";
    });

    detail.developers?.forEach((element) {
      developer += "${element.name}, ";
    });

    var desc = detail.descriptionRaw ?? "";

    return Center(
      child: ListView(
        key: const Key("infoTab Listview"),
        shrinkWrap: true,
        children: [
          Text("Description: ${parse(desc).documentElement?.text}"),
          SizedBox(
            height: 5.h,
          ),
          Text("Genre: $genre"),
          SizedBox(
            height: 5.h,
          ),
          Text("Platforms: $platform"),
          SizedBox(
            height: 5.h,
          ),
          Text("Publishers: $publisher"),
          SizedBox(
            height: 5.h,
          ),
          Text("Developers: $developer"),
        ],
      ),
    );
  }
}

class ScreenshotTab extends StatelessWidget {
  final GameDetailResponse detail;

  const ScreenshotTab({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key("screenshotTab SingleChildScrollView"),
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 200,
        child: ListView.separated(
            key: const Key("screenshotTab ListView.separated"),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, pos) {
              var tag = detail.tags ?? [];
              return AppCachedNetworkImage(
                height: 100.h,
                width: 200.w,
                url: tag[pos].imageBackground ?? '',
              );
            },
            separatorBuilder: (context, index) => Container(
                  width: 10.w,
                ),
            itemCount: detail.tags?.length ?? 0),
      ),
    );
  }
}
