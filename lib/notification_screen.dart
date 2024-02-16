import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String id;
   NotificationScreen({super.key,required this.id});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Text(widget.id.toString()),
    ),);
  }
}
