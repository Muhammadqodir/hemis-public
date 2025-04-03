import 'package:bloc/bloc.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/api/university_api.dart';
import 'package:hemispublic/models/infrastructure.dart';
import 'package:hemispublic/models/university.dart';
import 'package:meta/meta.dart';

part 'infrastructure_state.dart';

class InfrastructureCubit extends Cubit<InfrastructureState> {
  InfrastructureCubit() : super(InfrastructureInitial());

  void fetchStudents(University university) async {
    emit(InfrastructureLoading(university));
    ApiResponce<Infrastructure> responce = await UniversityApi(
      university.api_url ?? "undefined",
    ).getInfrastructure();
    if (responce.isSuccess) {
      emit(InfrastructureLoaded(
        university: university,
        infrastructure: responce.data!,
      ));
    } else {
      emit(InfrastructureError(
          title: responce.title, message: responce.message));
    }
  }
}
