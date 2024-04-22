import 'package:flutter/material.dart';

class TotalUser extends StatelessWidget {
  final String totalNoUser;
  final IconData icon;
  final String label;
  final Color color1;
  final Color color2;
  const TotalUser(
      {super.key,
      required this.totalNoUser,
      required this.icon,
      required this.label,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color1, color2

          // Color.fromARGB(255, 223, 48, 107),
          // Color.fromARGB(255, 230, 140, 170)
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              textScaler: const TextScaler.linear(1.5),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w100),
            ),
            // const SizedBox(
            //   width: 40,
            // ),
            Text(
              totalNoUser,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
            )
          ],
        ),
      ),
    );
  }
}
