 import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class DriedFruitsPage extends StatefulWidget {
  const DriedFruitsPage({super.key});

  @override
  State<DriedFruitsPage> createState() => _DriedFruitsPageState();
}

class _DriedFruitsPageState extends State<DriedFruitsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Hello World")),
    );
  }
}