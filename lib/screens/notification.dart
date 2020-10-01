import 'package:flutter/material.dart';
import 'package:skype_clone/screens/pageviews/chats/widgets/quiet_box.dart';
import 'package:skype_clone/utils/universal_variables.dart';
import 'package:skype_clone/widgets/appbar.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: CustomAppBar(
          title: Text("Notification"),
          actions: null,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true),
      body: QuietBox(
        heading: "No Notifiaction yet",
        subtitle:
            "Search for your friends and family to start calling or chatting with them",
      ),
    );
  }
}
