import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GreeneryPage extends StatefulWidget {
  const GreeneryPage({super.key});

  @override
  State<GreeneryPage> createState() => _GreeneryPageState();
}

class _GreeneryPageState extends State<GreeneryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello World")),
    );
  }
}
