import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget{
  final String imgPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? radius;
  const CustomImage({super.key, required this.imgPath, required this.height, this.width, this.fit, this.radius});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imgPath,
        errorWidget: (context,_,err){
          return Center(
            child: Icon(Icons.error)
          );
        },
        imageBuilder: (context,image){
          return Container(
            decoration: BoxDecoration(
             borderRadius: .circular(radius??10),
              image: DecorationImage(
                  fit: fit??BoxFit.contain,
                  image: image)
            ),
          );
        },
    );
  }

}