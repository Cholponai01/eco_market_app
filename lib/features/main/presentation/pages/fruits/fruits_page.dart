 import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';



@RoutePage()
class FruitsPage extends StatefulWidget {
  const FruitsPage({super.key});

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Hello World")),
    );
  }
}