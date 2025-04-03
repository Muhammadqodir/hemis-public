import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Infrastructure {
  Map<String, dynamic> groups;
  List<dynamic> auditoriums;
  List<dynamic> specialities;
  List<dynamic> departments;
  Infrastructure({
    required this.groups,
    required this.auditoriums,
    required this.specialities,
    required this.departments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groups': groups,
      'auditoriums': auditoriums,
      'specialities': specialities,
      'departments': departments,
    };
  }

  factory Infrastructure.fromMap(Map<String, dynamic> map) {
    return Infrastructure(
      groups: Map<String, dynamic>.from(
        (map['groups'] as Map<String, dynamic>),
      ),
      auditoriums: List<dynamic>.from(
        (map['auditoriums'] as List<dynamic>),
      ),
      specialities: List<dynamic>.from(
        (map['specialities'] as List<dynamic>),
      ),
      departments: List<dynamic>.from(
        (map['departments'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Infrastructure.fromJson(String source) =>
      Infrastructure.fromMap(json.decode(source) as Map<String, dynamic>);
}
