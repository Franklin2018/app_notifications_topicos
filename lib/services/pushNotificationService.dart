import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging mensaje = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStreamController =
      new StreamController.broadcast();

  static Stream<String> get messagesStreamController =>
      _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('onbackground Handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['valor'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessage Handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['valor'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp Handler: ${message.messageId}');
    print(message.data);
    _messageStreamController.add(message.data['valor'] ?? 'No data');
  }

  static Future initializeApp() async {
    //push notifications

    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print(token);
    //aqui se puede hacer una peticion http al backend y grabar el token para el usuario

    //handler
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //local notifications
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
