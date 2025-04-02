import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Employers {
  Map<String, dynamic> position;
  Map<String, dynamic> gender;
  Map<String, dynamic> citizenship;
  Map<String, dynamic> academic_degree;
  Map<String, dynamic> academic_rank;
  Map<String, dynamic> direction;
  Map<String, dynamic> academic;
  Map<String, dynamic> age;
  Map<String, dynamic> employment_form;

  Employers({
    required this.position,
    required this.gender,
    required this.citizenship,
    required this.academic_degree,
    required this.academic_rank,
    required this.direction,
    required this.academic,
    required this.age,
    required this.employment_form,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position': position,
      'gender': gender,
      'citizenship': citizenship,
      'academic_degree': academic_degree,
      'academic_rank': academic_rank,
      'direction': direction,
      'academic': academic,
      'age': age,
      'employment_form': employment_form,
    };
  }

  factory Employers.fromMap(Map<String, dynamic> map) {
    return Employers(
      position: Map<String, dynamic>.from(
        (map['position'] as Map<String, dynamic>),
      ),
      gender: Map<String, dynamic>.from(
        (map['gender'] as Map<String, dynamic>),
      ),
      citizenship: Map<String, dynamic>.from(
        (map['citizenship'] as Map<String, dynamic>),
      ),
      academic_degree: Map<String, dynamic>.from(
        (map['academic_degree'] as Map<String, dynamic>),
      ),
      academic_rank: Map<String, dynamic>.from(
        (map['academic_rank'] as Map<String, dynamic>),
      ),
      direction: Map<String, dynamic>.from(
        (map['direction'] as Map<String, dynamic>),
      ),
      academic: Map<String, dynamic>.from(
        (map['academic'] as Map<String, dynamic>),
      ),
      age: Map<String, dynamic>.from(
        (map['age'] as Map<String, dynamic>),
      ),
      employment_form: Map<String, dynamic>.from(
        (map['employment_form'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employers.fromJson(String source) =>
      Employers.fromMap(json.decode(source) as Map<String, dynamic>);
}
