import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playdouban/model/MovieHot.dart';

class MultiImageWidget extends StatefulWidget {
  // 层叠图片网络地址
  List<Subjects> imageUrls;

  // 层叠图片距离左边的距离
  double leftPadding;

  // 层叠View的宽度
  double width;

  MultiImageWidget(this.imageUrls, this.leftPadding, this.width);

  @override
  State<StatefulWidget> createState() => new MultiImageState();
}

class MultiImageState extends State<MultiImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
              left: widget.leftPadding + 45,
              top: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.imageUrls.isNotEmpty
                      ? widget.imageUrls[0].images.large
                      : "",
                  width: widget.width,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              left: widget.leftPadding + 25,
              top: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.imageUrls.isNotEmpty
                      ? widget.imageUrls[1].images.large
                      : "",
                  width: widget.width,
                  height: 105,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              left: widget.leftPadding,
              top: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.imageUrls.isNotEmpty
                      ? widget.imageUrls[2].images.large
                      : "",
                  width: widget.width,
                  height: 105,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }
}
