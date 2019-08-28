import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  // 星星个数
  num starCount;

  // 开始位置
  int start;

  // 评分增级
  double step;

  RatingBar(this.starCount, this.start, this.step);

  @override
  State<StatefulWidget> createState() => new RatingBarState();
}

class RatingBarState extends State<RatingBar> {
  @override
  Widget build(BuildContext context) {
    int start = widget.start;
    double step = widget.step;
    if (widget.starCount > start && widget.starCount < start + step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + step &&
        widget.starCount < start + 2 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 2 * step &&
        widget.starCount < start + 3 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 3 * step &&
        widget.starCount < start + 4 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 4 * step &&
        widget.starCount < start + 5 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 5 * step &&
        widget.starCount < start + 6 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 6 * step &&
        widget.starCount < start + 7 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 7 * step &&
        widget.starCount < start + 8 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 8 * step &&
        widget.starCount < start + 9 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else if (widget.starCount >= start + 9 * step &&
        widget.starCount <= start + 10 * step) {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.amber,
          ),
        ],
      );
    }
  }
}
