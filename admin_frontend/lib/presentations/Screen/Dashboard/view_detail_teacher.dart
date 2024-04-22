import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:admin/presentations/Screen/search/searchTeacherText.dart';
import 'package:admin/presentations/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/logic_exports.dart';
import 'home.dart';

class ViewDetailsOfTeacher extends StatefulWidget {
  ViewDetailsOfTeacher({super.key});

  @override
  State<ViewDetailsOfTeacher> createState() => _ViewDetailsOfTeacherState();
}

class _ViewDetailsOfTeacherState extends State<ViewDetailsOfTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [_buildSectionTitle(), _buildTeacherDetails()],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2.5,
        ),
        SearchButton(
          label: "Search teachers",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => SearchScreenTeacherText()));
          },
        )
      ],
    );
  }

  Widget _buildTeacherDetails() {
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
                      "TEACHERS DETAILS",
                      style: TextStyle(),
                      textScaler: TextScaler.linear(2),
                    ),
                  ],
                ),
                DataTableTeacherHomeView(
                  teachers: state.teachers,
                )
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
