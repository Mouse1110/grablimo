import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/model/staff.dart';
import 'package:provider/provider.dart';

class Push {
  static Future nextClient({BuildContext context, Widget page}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ClientModel(),
          ),
        ],
        child: page,
      ),
    ));
  }

  static Future nextClientSave({BuildContext context, Widget page}) {
    ClientModel model = Provider.of<ClientModel>(context, listen: false);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => model,
          ),
        ],
        child: page,
      ),
    ));
  }

  static Future nextStaff({BuildContext context, Widget page}) {
    StaffModel model = Provider.of<StaffModel>(context, listen: false);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => model,
          ),
        ],
        child: page,
      ),
    ));
  }
}
