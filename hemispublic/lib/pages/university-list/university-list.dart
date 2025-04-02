import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemispublic/cubit/university_list_cubit.dart';
import 'package:hemispublic/layouts/custom-layout.dart';
import 'package:hemispublic/utils/dialogs.dart';
import 'package:hemispublic/widgets/university-list-item.dart';

class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  Widget _getPageContent(UniversityListState state, BuildContext context) {
    if (state is UniversityListLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UniversityListLoaded) {
      return Column(
        children: state.universities
            .map(
              (e) => UniversityListItem(
                university: e,
              ),
            )
            .toList(),
      );
    } else if (state is UniversityListError) {
      return Column(
        children: [
          Text(
            state.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(state.message),
        ],
      );
    }
    return const Center(
      child: Text("Invalid state"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityListCubit, UniversityListState>(
      builder: (context, state) {
        return CustomLayout(
          child: _getPageContent(state, context),
          title: Row(
            children: [
              Text("test"),
            ],
          ),
        );
      },
    );
  }
}
