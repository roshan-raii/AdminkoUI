import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const SearchButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: MediaQuery.of(context).size.width / 6,
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 118, 117, 117)),
                  textScaler: TextScaler.linear(1.5),
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.search,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(66, 123, 120, 120))),
        ),
      ),
    );
  }
}
