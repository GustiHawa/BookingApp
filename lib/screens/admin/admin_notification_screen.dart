import 'package:flutter/material.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Notifications'),
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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              notifications[index],
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AdminNotificationScreen(),
  ));
}
