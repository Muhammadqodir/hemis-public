import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> getBase64NetworkImage(String url) async {
  final response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}