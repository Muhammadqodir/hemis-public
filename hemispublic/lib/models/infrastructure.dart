import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Infrastructure {
  Map<String, dynamic> groups;
  Map<String, dynamic> auditoriums;
  Map<String, dynamic> specialities;
  Map<String, dynamic> departments;
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
      auditoriums: Map<String, dynamic>.from(
        (map['auditoriums'] as Map<String, dynamic>),
      ),
      specialities: Map<String, dynamic>.from(
        (map['specialities'] as Map<String, dynamic>),
      ),
      departments: Map<String, dynamic>.from(
        (map['departments'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Infrastructure.fromJson(String source) =>
      Infrastructure.fromMap(json.decode(source) as Map<String, dynamic>);
}
