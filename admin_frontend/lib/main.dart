import 'package:admin/logic/cubits/add_student/add_student_cubit.dart';
import 'package:admin/logic/cubits/fetch_module_year_faculty/fetch_module_year_faculty_cubit.dart';
import 'package:admin/logic/cubits/get_module_by_year/get_module_by_year_cubit.dart';
import 'package:admin/logic/cubits/store_images/cubit/store_images_cubit.dart';
import 'package:admin/presentations/config/app_router.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubits/add_teacher/add_teacher_cubit.dart';
import 'logic/logic_exports.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => AddFacultyCubit(),
        ),
        BlocProvider(
          create: (context) => FetchFacultyCubit(),
        ),
        BlocProvider(
          create: (context) => AddYearCubit(),
        ),
        BlocProvider(
          create: (context) => FetchYearsCubit(),
        ),
        BlocProvider(
          create: (context) => ViewUsersCubit(),
        ),
        BlocProvider(
          create: (context) => AddModuleCubit(),
        ),
        BlocProvider(
          create: (context) => FetchModuleCubit(),
        ),
        BlocProvider(
          create: (context) => AddRoutineCubit(),
        ),
        BlocProvider(
          create: (context) => FetchRoutineCubit(),
        ),
        BlocProvider(
          create: (context) => StoreImagesCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSectionsCubit(),
        ),
        BlocProvider(
          create: (context) => DropDownValueCubit(),
        ),
        BlocProvider(
          create: (context) => StoreValueCubit(),
        ),
        BlocProvider(
          create: (context) => AddStudentCubit(),
        ),
        BlocProvider(create: (context) => AddTeacherCubit()),
        BlocProvider(create: (context) => FetchYearSectionsCubit()),
        BlocProvider(create: (context) => RoutineDropdownLogicCubit()),
        BlocProvider(create: (context) => FetchModuleFacultyCubit()),
        BlocProvider(create: (context) => FetchYearSectionsCubit()),
        BlocProvider(create: (context) => FetchModuleYearFacultyCubit()),
        BlocProvider(create: (context) => AddModuleYearFacultyCubit()),
        BlocProvider(create: (context)=> DeleteModuleCubit()),
        BlocProvider(create: (context)=> AddModuleTeacherCubit()),
        BlocProvider(create: (context)=> DeleteModuleTeacherCubit()),
        BlocProvider(create: (context)=> ViewModuleTeacherCubit()),
        BlocProvider(create: (context)=> GetAllTeachersCubit()),
        BlocProvider(create: (context)=> FetchFacultyYearSectionCubit()),
        BlocProvider(create: (context)=> AddFacultyYearSectionCubit()),
        BlocProvider(create: (context)=> DeleteFacultyYearSectionCubit()),
        BlocProvider(create: (context)=> DeleteRoutineCubit()),
        BlocProvider(create: (context)=> GetModuleByYearCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().routeSettings,
      ),
    );
  }
}
