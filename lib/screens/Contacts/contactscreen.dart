import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/enum/contact_state.dart';
import 'package:skype_clone/provider/contact_provider.dart';
import 'package:skype_clone/screens/Contacts/Contactlist.dart';
import 'package:skype_clone/utils/universal_variables.dart';
import 'package:skype_clone/widgets/skype_appbar.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    var contactState = Provider.of<ContactProvider>(context, listen: false);
    print(contactState.getContactState);
    return contactState.getContactState == ContactState.NOTSET
        ? Scaffold(
            backgroundColor: UniversalVariables.blackColor,
            appBar: SkypeAppBar(
              actions: [],
              title: Text("Contacts"),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: UniversalVariables.separatorColor,
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "This is where all the contacts are listed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Search for your friends and family to start calling or chatting with them",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 25),
                      FlatButton(
                        color: UniversalVariables.lightBlueColor,
                        child: Text("CONTACT"),
                        onPressed: () async {
                          final PermissionStatus permissionStatus =
                              await _getPermission();
                          if (permissionStatus == PermissionStatus.granted) {
                            setState(() {
                              contactState.setContact();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : ContactList();
  }
}
