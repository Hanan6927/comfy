import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatefulWidget {
  List list; String src;
 ImageSlider({ Key? key , required this.list, required this.src}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final children = <Widget>[];
  
  @override
  Widget build(BuildContext context) {
    if (widget.list.length != 0){
    for (var i = 0; i < widget.list.length; i++){
      children.add(Image(image: NetworkImage("${widget.list[i].src}"),
      width: double.infinity,
      fit: BoxFit.fitWidth,));
    }}
    else {
      // ignore: unnecessary_string_interpolations
      children.add(Image(image: NetworkImage("${widget.src}")));
    }
    return ImageSlideshow(children: children);
  }
}