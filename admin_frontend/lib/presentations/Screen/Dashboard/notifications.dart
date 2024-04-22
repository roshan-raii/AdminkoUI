import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildSectionTitle(), _notificationPanel(), _pushButton()],
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
        )
      ],
    );
  }

  Widget _notificationPanel() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Push new notification",
                textScaler: TextScaler.linear(2),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text("Title:"),
          SizedBox(
            height: 5,
          ),
          MyTextField(
            label: "Title",
          ),
          SizedBox(
            height: 5,
          ),
          Text("Content:"),
          SizedBox(
            height: 5,
          ),
          MyTextField(
            minLines: 5,
            maxLines: 6,
            label: "Your content",
          ),
        ],
      ),
    );
  }

  Widget _pushButton() {
    return const Padding(
      padding: EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            width: 170,
            child: MyButton(
              text: "Push",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
