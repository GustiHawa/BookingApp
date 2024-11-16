import 'package:flutter/material.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Notifications'),
      ),
      body: NotificationList(),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 4',
  ];

  NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notifications[index]),
          leading: Icon(Icons.notifications),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Handle notification tap
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminNotificationScreen(),
  ));
}