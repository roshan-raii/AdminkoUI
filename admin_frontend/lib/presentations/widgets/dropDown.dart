import 'package:flutter/material.dart';

class DropDownGender extends StatefulWidget {
  const DropDownGender({super.key});

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  String dropdownvalue = "Male";
  var items = ["Male", "Female", "Other"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border:
                Border.all(color: const Color.fromARGB(255, 113, 112, 112))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            isExpanded: true,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}

class DropDownAcademicYear extends StatefulWidget {
  const DropDownAcademicYear({super.key});

  @override
  State<DropDownAcademicYear> createState() => DropDownAcademicYearState();
}

class DropDownAcademicYearState extends State<DropDownAcademicYear> {
  String dropdownvalue = "1st Year";
  var items = ["1st Year", "2nd Year", "3rd Year"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            isExpanded: true,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}

class DropDownFaculty extends StatefulWidget {
  const DropDownFaculty({super.key});

  @override
  State<DropDownFaculty> createState() => _DropDownFacultyState();
}

class _DropDownFacultyState extends State<DropDownFaculty> {
  String dropdownvalue = "Bsc(hons) Computing";
  var items = ["Bsc(hons) Computing", "Bsc(hons) Business Administration"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,

              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          )),
    );
  }
}

class DropDownAcademicSection extends StatefulWidget {
  const DropDownAcademicSection({super.key});

  @override
  State<DropDownAcademicSection> createState() =>
      DropDownAcademicSectionState();
}

class DropDownAcademicSectionState extends State<DropDownAcademicSection> {
  String dropdownvalue = "L1C1";
  var items = ["L1C1", "L1C2", "L1C3"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            isExpanded: true,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}

class DropDownDay extends StatefulWidget {
  const DropDownDay({super.key});

  @override
  State<DropDownDay> createState() => DropDownDayState();
}

class DropDownDayState extends State<DropDownDay> {
  String dropdownvalue = "Sunday";
  var items = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            isExpanded: true,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}

class DropDownModule extends StatefulWidget {
  const DropDownModule({super.key});

  @override
  State<DropDownModule> createState() => DropDownModuleState();
}

class DropDownModuleState extends State<DropDownModule> {
  String dropdownvalue = "Java";
  var items = [
    "Java",
    "Information of operating system",
    "Hardware",
    "Network operating system",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            isExpanded: true,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}
