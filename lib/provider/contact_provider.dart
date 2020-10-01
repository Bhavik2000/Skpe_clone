import 'package:flutter/cupertino.dart';
import 'package:skype_clone/enum/contact_state.dart';

class ContactProvider with ChangeNotifier {
  ContactState initial = ContactState.NOTSET;

  ContactState get getContactState => initial;

  void setContact() {
    initial = ContactState.SET;
    notifyListeners();
  }

  void notsetContact() {
    initial = ContactState.NOTSET;
    notifyListeners();
  }
}
