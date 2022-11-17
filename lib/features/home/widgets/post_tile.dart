import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/models/top_stories.dart';
import 'package:flutter_task/core/utils/size_mg.dart';

class PostTile extends StatelessWidget {
  final FeaturedArticle? post;

  const PostTile({
    Key? key,
    required this.post,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: post?.photoUrl ?? '',
          imageBuilder: (context, image) {
            return Container(
              height: SizeMg.height(200),
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: SizeMg.width(20)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeMg.radius(10),),
                    topRight: Radius.circular(SizeMg.radius(10),)),
              ),
            );
          },
          placeholder: (context, url) {
            return Container(
              height: SizeMg.height(200),
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: SizeMg.width(20)),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(.3),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeMg.radius(10),),
                    topRight: Radius.circular(SizeMg.radius(10),)),
              ),
            );
          },
          errorWidget: (context, url, error) => Container(
            height: SizeMg.height(200),
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: SizeMg.width(20)),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeMg.radius(10),),
                  topRight: Radius.circular(SizeMg.radius(10),)),
            ),
            child: const Center(
              child: Icon(Icons.sports_basketball),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: SizeMg.width(20)),
          padding: EdgeInsets.symmetric(horizontal: SizeMg.width(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeMg.height(5),),
              Text(
                "Category: ${post?.categoryLabel}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeMg.text(14),
                ),
              ),
              Text(
                "${post?.title}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeMg.text(14),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}