// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class WebNetworkImage extends StatefulWidget {
  const WebNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    required this.onFail,
    required this.onLoading,
    this.fit,
  });

  final String url;
  final double? height;
  final double? width;
  final Widget onFail;
  final Widget onLoading;
  final BoxFit? fit;

  @override
  State<WebNetworkImage> createState() => _WebNetworkImageState();
}

class _WebNetworkImageState extends State<WebNetworkImage> {
  bool isLoading = true;
  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    _getBase64Image(widget.url);
  }

  void _getBase64Image(String url) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        imageData = response.bodyBytes;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? widget.onLoading
        : imageData != null
            ? Image.memory(
                imageData!,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
              )
            : widget.onFail;
  }
}
