import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';

import '../../../../domain/models/response/news_response.dart';
import '../../../widgets/cached_network_image_utils.dart';

Widget listviewLayout(ScrollController scrollController, List<NewsArticles> result) {
  return ListView.separated(
      key: const Key("Game List Content Component ListView"),
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return InkWell(
          key: Key("Game List Content Component InkWell - $index"),
          onTap: () => context.goToDetail(item),
          child: Container(
            margin: REdgeInsets.all(10),
            padding: REdgeInsets.only(top: 10),
            decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppCachedNetworkImage(
                  height: 75.h,
                  width: 150.w,
                  fit: BoxFit.contain,
                  url: item.urlToImage ?? '',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Name: ${item.title}"),
                const SizedBox(
                  height: 10,
                ),
                Text('Released date: ${item.publishedAt}'),
                const SizedBox(
                  height: 10,
                ),
                Text("Metacritic Score : ${item.description}"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}

Widget gridviewLayout(ScrollController scrollController, List<NewsArticles> result) {
  return GridView.builder(
    key: const Key("Game List Content Component GridView"),
    controller: scrollController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
    itemBuilder: (context, index) {
      var item = result[index];
      return InkWell(
        key: Key("Game List Content GridView Component InkWell - $index"),
        onTap: () => context.goToDetail(item),
        child: Container(
          margin: REdgeInsets.all(10),
          padding: REdgeInsets.only(top: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCachedNetworkImage(
                height: 50.h,
                width: 100.w,
                fit: BoxFit.contain,
                url: item.urlToImage ?? '',
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Name: ${item.title}"),
              const SizedBox(
                height: 10,
              ),
              Text('Released date: ${item.publishedAt}'),
              const SizedBox(
                height: 10,
              ),
              Text("Metacritic Score : ${item.content}"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    },
    shrinkWrap: true,
    itemCount: result.length,
  );
}