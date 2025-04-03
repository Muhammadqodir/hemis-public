import 'package:flutter/cupertino.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/university.dart';

class EmployersContent extends StatelessWidget {
  const EmployersContent({
    super.key,
    required this.employers,
    required this.university,
  });

  final Employers employers;
  final University university;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(employers.toJson()),
    );
  }
}
