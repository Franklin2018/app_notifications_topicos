import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_doctor_app/pages/homePage.dart';
import 'package:jitsi_doctor_app/pages/meetJitsi.dart';
import 'package:jitsi_doctor_app/services/pushNotificationService.dart';

import 'pages/mensajesPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messagesStreamController.listen((message) {
      print('myApp: $message');

      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home': (_) => HomePage(),
        'mensaje': (_) => MensajesPage(),
        'meet': (_) => MeetingPage(),
      },
    );
  }
}
