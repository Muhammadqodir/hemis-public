import 'package:bloc/bloc.dart';
import 'package:hemispublic/api/hemis_pubic_api.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/models/university.dart';
import 'package:meta/meta.dart';

part 'university_list_state.dart';

class UniversityListCubit extends Cubit<UniversityListState> {
  UniversityListCubit() : super(UniversityListInitial());

  Future<void> fetchUniversities() async {
    emit(UniversityListLoading());
    ApiResponce apiResponce = await HemisPubicApi.getUniversities();
    if (apiResponce.isSuccess) {
      emit(UniversityListLoaded(apiResponce.data));
    } else {
      emit(
        UniversityListError(
          title: apiResponce.title,
          message: apiResponce.message,
        ),
      );
    }
  }
}
