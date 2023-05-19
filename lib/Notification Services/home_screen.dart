
 import 'package:flutter/material.dart';
import 'package:maximagri/Notification%20Services/notification_services.dart';

class HomeScreenNotification extends StatefulWidget {
   const HomeScreenNotification({Key? key}) : super(key: key);

   @override
   State<HomeScreenNotification> createState() => _HomeScreenNotificationState();
 }

 class _HomeScreenNotificationState extends State<HomeScreenNotification> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
   // notificationServices.isTokenRefersh();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token");
      print(value);
    });
  }

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       appBar: AppBar(title: Text("Notification"),),

       body: Center(
         child: ElevatedButton(
           onPressed: (){
             notificationServices.requestNotificationPermission();
           },
           child: Text("Notification"),
         ),
       ),
     );
   }
 }
