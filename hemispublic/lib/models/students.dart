import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Students {
  Map<String, dynamic> education_type;
  Map<String, dynamic> age;
  Map<String, dynamic> payment;
  Map<String, dynamic> region;
  Map<String, dynamic> citizenship;
  Map<String, dynamic> accommodation;
  Map<String, dynamic> education_form;
  Map<String, dynamic> level;

  Students({
    required this.education_type,
    required this.age,
    required this.payment,
    required this.region,
    required this.citizenship,
    required this.accommodation,
    required this.education_form,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'education_type': education_type,
      'age': age,
      'payment': payment,
      'region': region,
      'citizenship': citizenship,
      'accommodation': accommodation,
      'education_form': education_form,
      'level': level,
    };
  }

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      education_type: Map<String, dynamic>.from(
        (map['education_type'] as Map<String, dynamic>),
      ),
      age: Map<String, dynamic>.from(
        (map['age'] as Map<String, dynamic>),
      ),
      payment: Map<String, dynamic>.from(
        (map['payment'] as Map<String, dynamic>),
      ),
      region: Map<String, dynamic>.from(
        (map['region'] as Map<String, dynamic>),
      ),
      citizenship: Map<String, dynamic>.from(
        (map['citizenship'] as Map<String, dynamic>),
      ),
      accommodation: Map<String, dynamic>.from(
        (map['accommodation'] as Map<String, dynamic>),
      ),
      education_form: Map<String, dynamic>.from(
        (map['education_form'] as Map<String, dynamic>),
      ),
      level: Map<String, dynamic>.from(
        (map['level'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Students.fromJson(String source) =>
      Students.fromMap(json.decode(source) as Map<String, dynamic>);
}
