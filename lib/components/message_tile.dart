// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final Widget child;
  const MessageTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color(0xFFE6F5E6),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: child,
    );
  }
}
