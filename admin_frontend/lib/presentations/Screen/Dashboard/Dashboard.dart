import 'package:admin/presentations/Screen/Faculty/add_and_view_faculty.dart';
import 'package:admin/presentations/Screen/Dashboard/add_user.dart';
import 'package:admin/presentations/Screen/Year/add_and_view_year.dart';
import 'package:admin/presentations/Screen/Dashboard/attendance.dart';
import 'package:admin/presentations/Screen/Dashboard/home.dart';
import 'package:admin/presentations/Screen/Dashboard/module.dart';
import 'package:admin/presentations/Screen/Dashboard/notifications.dart';
import 'package:admin/presentations/Screen/Dashboard/routine.dart';
import 'package:admin/presentations/Screen/Dashboard/view_details.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //content for dashboard components
  final List<Widget> _screens = [
    Home(),
    AddUserScreen(),
    ViewDetails(),
    NotificationScreen(),
    Routinescreen(),
    ModuleScreen(),
    ViewAttendance(),
    AddFaculty(),
    AddYear(),
  ];

  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
            extended: isExpanded,
            labelType: NavigationRailLabelType.selected,
            selectedLabelTextStyle: TextStyle(
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 13, 11, 139),
            unselectedIconTheme: IconThemeData(color: Colors.white, opacity: 1),
            unselectedLabelTextStyle: TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Colors.green),
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text("Dashboard"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_add),
                label: Text("Add Users"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.remove_red_eye),
                label: Text("View Details"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications),
                label: Text("Notifications"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.timer),
                label: Text("Routine"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.book),
                label: Text("Module"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add_circle_outline_outlined),
                label: Text("Attendance"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add),
                label: Text("Add Faculty"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add),
                label: Text("Add Year"),
              ),
            ],
          ),
          Expanded(child: _screens[_selectedIndex])
          // Expanded(
          //   child: Padding(
          //     padding:  EdgeInsets.all(10.0),
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           //adding navigation menu
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               IconButton(
          //                   onPressed: () {
          //                     setState(() {
          //                       isExpanded = !isExpanded;
          //                     });
          //                   },
          //                   icon:  Icon(Icons.menu)),
          //               Image.asset(
          //                 "assets/images/banner.png",
          //                 height: 60,
          //               ),
          //               Expanded(child: _screens[_selectedIndex])
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
