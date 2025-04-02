import 'package:flutter/material.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/api/university_api.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/states/loading.dart';
import 'package:hemispublic/widgets/ontapscale.dart';

class UniversityListItem extends StatefulWidget {
  const UniversityListItem({
    super.key,
    required this.university,
  });

  final University university;

  @override
  State<UniversityListItem> createState() => _UniversityListItemState();
}

class _UniversityListItemState extends State<UniversityListItem> {
  CustomStates state = LoadingState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFullData();
  }

  void _getFullData() async {
    setState(() {
      state = LoadingState();
    });
    ApiResponce<University> responce =
        await UniversityApi(widget.university.api_url!).getUniverData();
    if (responce.isSuccess) {
      setState(() {
        state = SuccessState<University>(responce.data!);
      });
    } else {
      setState(() {
        state = ErrorState(
          title: responce.title,
          message: responce.message,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: .98,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: state is SuccessState<University>
                ? Image.network(
                    (state as SuccessState).data.logo!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.university.name!),
                state is SuccessState<University>
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (state as SuccessState<University>).data.contact ??
                                "Undefined",
                          ),
                          Text(
                            (state as SuccessState<University>)
                                    .data
                                    .bankDetails ??
                                "Undefined",
                          )
                        ],
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
