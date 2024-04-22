import 'package:admin/logic/cubits/store_images/cubit/store_images_cubit.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/add_student.dart';
import 'package:admin/presentations/Screen/Dashboard/add_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2,
        ),
        SizedBox(
          height: 50,
        ),
        Center(
            child: InkWell(
                onTap: () {
                  context.read<StoreImagesCubit>()..clearImages();
                  context.read<DropDownValueCubit>()
                    ..instantiateDropDownValue(items: ['M', 'F']);
                  context.read<DropDownValueCubit>()..changeDropDownValue('M');
                  fetchAllSections(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddStudent()));
                },
                child: AddUserButton(label: "Add Student"))),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              context.read<StoreImagesCubit>()..clearImages();
              var loginBloc = context.read<LoginBloc>().state;
              if (loginBloc is LoginSuccess) {
                context.read<FetchFacultyCubit>()
                  ..fetchFaulties(token: loginBloc.successModel.token!);
              }
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddTeacher()));
            },
            child: AddUserButton(label: "Add Teacher"))
      ],
    ));
  }

  void fetchAllSections(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<FetchSectionsCubit>()
        ..fetchSections(token: loginState.successModel.token!);
    }
  }
}

class AddUserButton extends StatelessWidget {
  final String label;

  AddUserButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 6.0)],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color.fromARGB(255, 13, 15, 119)),
            color: Color.fromARGB(255, 13, 15, 119)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
