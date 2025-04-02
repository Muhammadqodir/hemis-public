import 'dart:convert';

import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/infrastructure.dart';
import 'package:hemispublic/models/students.dart';
import 'package:hemispublic/models/university.dart';
import 'package:http/http.dart' as http;

class UniversityApi {
  String baseUrl;

  UniversityApi(this.baseUrl);

  Future<ApiResponce<University>> getUniverData() async {
    try {
      print("${baseUrl}public/university-profile");
      http.Response response = await http
          .get(
            Uri.parse('${baseUrl}public/university-profile'),
          )
          .timeout(
            const Duration(seconds: 3),
          );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["code"] != 200) {
        return ApiResponce.error(
          title: "Server Error: ${data["code"]}",
          message: data["error"].toString(),
        );
      } else {
        data["data"]["api_url"] = baseUrl;
        return ApiResponce.success(data: University.fromJson(data["data"]));
      }
    } catch (e, s) {
      return ApiResponce.error(title: e.toString(), message: s.toString());
    }
  }

  Future<ApiResponce<Students>> getStudents() async {
    try {
      http.Response response = await http
          .get(
            Uri.parse('${baseUrl}public/stat-student'),
          )
          .timeout(
            const Duration(seconds: 3),
          );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["code"] != 200) {
        return ApiResponce.error(
          title: "Server Error: ${data["code"]}",
          message: data["error"].toString(),
        );
      } else {
        return ApiResponce.success(data: Students.fromMap(data["data"]));
      }
    } catch (e, s) {
      return ApiResponce.error(title: e.toString(), message: s.toString());
    }
  }

  Future<ApiResponce<Employers>> getEmployers() async {
    try {
      http.Response response = await http
          .get(
            Uri.parse('${baseUrl}public/stat-employee'),
          )
          .timeout(
            const Duration(seconds: 3),
          );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["code"] != 200) {
        return ApiResponce.error(
          title: "Server Error: ${data["code"]}",
          message: data["error"].toString(),
        );
      } else {
        return ApiResponce.success(data: Employers.fromMap(data["data"]));
      }
    } catch (e, s) {
      return ApiResponce.error(title: e.toString(), message: s.toString());
    }
  }

  Future<ApiResponce<Infrastructure>> getInfrastructure() async {
    try {
      http.Response response = await http
          .get(
            Uri.parse('${baseUrl}public/stat-structure'),
          )
          .timeout(
            const Duration(seconds: 3),
          );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["code"] != 200) {
        return ApiResponce.error(
          title: "Server Error: ${data["code"]}",
          message: data["error"].toString(),
        );
      } else {
        return ApiResponce.success(data: Infrastructure.fromMap(data["data"]));
      }
    } catch (e, s) {
      return ApiResponce.error(title: e.toString(), message: s.toString());
    }
  }
}
