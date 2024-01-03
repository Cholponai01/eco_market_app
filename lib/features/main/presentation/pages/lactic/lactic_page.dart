 import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class LacticPage extends StatefulWidget {
  const LacticPage({super.key});

  @override
  State<LacticPage> createState() => _LacticPageState();
}

class _LacticPageState extends State<LacticPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Hello World")),
    );
  }
}