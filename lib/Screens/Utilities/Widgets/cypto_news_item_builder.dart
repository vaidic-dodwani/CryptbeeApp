import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Models/news_model.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget cryptoNewsItemBuilder(News news) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(news.news));
      },
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: 78,
                width: 46,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  news.headline,
                  style: titleSmall(),
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
