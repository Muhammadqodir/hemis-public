import 'dart:convert';

import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/models/university.dart';
import 'package:http/http.dart' as http;

class HemisPubicApi {
  static String baseUrl = "https://student.hemis.uz/rest/v1/";

  static Future<ApiResponce<List<University>>> getUniversities() async {
    try {
      http.Response response = await http.get(
        Uri.parse('${baseUrl}public/university-list'),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["code"] != 200) {
        return ApiResponce.error(
          title: "Server Error: ${data["code"]}",
          message: data["error"].toString(),
        );
      }else{
        List<University> universities = [];
        for (Map<String, dynamic> item in data["data"]) {
          universities.add(University.fromJson(item));
        }
        return ApiResponce.success(data: universities);
      }
    } catch (e, s) {
      return ApiResponce.error(title: e.toString(), message: s.toString());
    }
  }
}
