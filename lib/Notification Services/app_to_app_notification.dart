
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maximagri/Notification%20Services/notification_services.dart';

class AppToAppNotification extends StatefulWidget {
  const AppToAppNotification({Key? key}) : super(key: key);

  @override
  State<AppToAppNotification> createState() => _AppToAppNotificationState();
}

class _AppToAppNotificationState extends State<AppToAppNotification> {

  NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Center(
        child: TextButton(onPressed: (){


          notificationServices.getDeviceToken().then((value)async{

            var data = {
              'to' : value.toString(),
              'notification' : {
                'title' : 'Noman' ,
                'body' : 'Flutters' ,
                "sound": "jetsons_doorbell"
              },
              'android': {
                'notification': {
                  'notification_count': 23,
                },
              },
              'data' : {
                'type' : 'msj' ,
                'id' : 'Asif Taj'
              }
            };

            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data) ,
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization' : 'key=AAAA5E6_FQw:APA91bG2pcT8d_C8-U1oihliyjOjlWgCv1T0WFRpysLwz0JcujnJwvDqG_t1U4HAO0rSE41XyEwWTdQL2EKekCTWc4qdVpc_Kp46LY3ZSSz-7_zGxoYia5gLLmG89sPBOJzvlqOuZTF_'
                }
            ).then((value){
              if (kDebugMode) {
                print(value.body.toString());
              }
            }).onError((error, stackTrace){
              if (kDebugMode) {
                print(error);
              }
            });
          });
        },
            child: Text('Send Notifications')),
      ),
    );
  }
}
