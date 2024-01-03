 import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class TeaCoffeePage extends StatefulWidget {
  const TeaCoffeePage({super.key});

  @override
  State<TeaCoffeePage> createState() => _TeaCoffeePageState();
}

class _TeaCoffeePageState extends State<TeaCoffeePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Hello World")),
    );
  }
}