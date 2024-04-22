import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:admin/presentations/Screen/Dashboard/home.dart';
import 'package:admin/presentations/Screen/search/searchStudentText.dart';
import 'package:admin/presentations/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/logic_exports.dart';

class ViewDetailsOfStudent extends StatefulWidget {
  ViewDetailsOfStudent({super.key});

  @override
  State<ViewDetailsOfStudent> createState() => _ViewDetailsOfStudentState();
}

class _ViewDetailsOfStudentState extends State<ViewDetailsOfStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [_buildSectionTitle(), _buildStudentDetails()],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2.5,
        ),
        SearchButton(
          label: "Search students",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => SearchScreenStudentText()));
          },
        )
      ],
    );
  }

  Widget _buildStudentDetails() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: BlocBuilder<ViewUsersCubit, ViewUsersState>(
        builder: (context, state) {
          if (state is ViewUsersInitial) {
            // context.read()
            callHomeApis(context);
          }
          if (state is ViewUsersLoading) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator()
              ],
            );
          }
          if (state is ViewUsersError) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  onPressed: () {
                    callHomeApis(context);
                  },
                  child: Text("Retry"),
                ),
              ],
            );
          }
          if (state is ViewUsersSuccess) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "STUDENTS DETAILS",
                      style: TextStyle(),
                      textScaler: TextScaler.linear(2),
                    ),
                  ],
                ),
                DataTableStudentHome(
                  student: state.student,
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  void callHomeApis(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<ViewUsersCubit>()
        ..viewUsers(token: loginState.successModel.token!);
    }
  }
}
