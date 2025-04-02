import 'package:bloc/bloc.dart';
import 'package:hemispublic/api/hemis_pubic_api.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/api/university_api.dart';
import 'package:hemispublic/models/university.dart';

part 'university_list_state.dart';

class UniversityListCubit extends Cubit<UniversityListState> {
  UniversityListCubit() : super(UniversityListInitial());

  Future<void> fetchUniversities() async {
    emit(UniversityListLoading(progress: 0.0));
    ApiResponce apiResponce = await HemisPubicApi.getUniversities();
    if (apiResponce.isSuccess) {
      List<University> universities = apiResponce.data;
      List<University> universitiesFullData = [];
      int total = universities.length;

      for (University university in universities) {
        ApiResponce<University> universityApiResponce =
            await UniversityApi(university.api_url ?? "undefined")
                .getUniverData();
        if (universityApiResponce.isSuccess) {
          universitiesFullData.add(universityApiResponce.data!);
          emit(UniversityListLoading(
            progress: universities.indexOf(university) / total,
            progressText: "Yuklanmoqda...\n${universities.indexOf(university) + 1}/$total",
          ));
        }
      }
      emit(UniversityListLoaded(universitiesFullData));
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
