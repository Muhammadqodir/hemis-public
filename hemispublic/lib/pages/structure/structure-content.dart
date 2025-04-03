import 'package:flutter/cupertino.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/infrastructure.dart';
import 'package:hemispublic/models/university.dart';

class InfrastructureContent extends StatelessWidget {
  const InfrastructureContent({
    super.key,
    required this.infrastructure,
    required this.university,
  });

  final Infrastructure infrastructure;
  final University university;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(infrastructure.toJson()),
    );
  }
}
