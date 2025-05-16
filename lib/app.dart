import 'package:flutter/material.dart';
import 'package:mediaquery_assignment/mediaquery_desing.dart';

class mediaqueryAssignment extends StatefulWidget {
  const mediaqueryAssignment({super.key});

  @override
  State<mediaqueryAssignment> createState() => _mediaqueryAssignmentState();
}

class _mediaqueryAssignmentState extends State<mediaqueryAssignment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: mediaqueryDesing());
  }
}
