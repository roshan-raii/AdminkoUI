// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  
  final Color? color;

  const DeleteButton({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Delete"),
                    )
                  ],
                  title: Text("Delete User?"),
                  contentPadding: const EdgeInsets.all(20),
                  content: const Text("Are you sure about deleting?"),
                )));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
