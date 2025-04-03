import 'package:bloc/bloc.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/api/university_api.dart';
import 'package:hemispublic/models/employers.dart';
import 'package:hemispublic/models/university.dart';
import 'package:meta/meta.dart';

part 'employers_state.dart';

class EmployersCubit extends Cubit<EmployersState> {
  EmployersCubit() : super(EmployersInitial());

  void fetchStudents(University university) async {
    emit(EmployersLoading(university));
    ApiResponce<Employers> responce = await UniversityApi(
      university.api_url ?? "undefined",
    ).getEmployers();
    if (responce.isSuccess) {
      emit(EmployersLoaded(
        university: university,
        employers: responce.data!,
      ));
    } else {
      emit(EmployersError(title: responce.title, message: responce.message));
    }
  }
}
