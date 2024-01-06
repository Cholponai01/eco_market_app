import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Продукты"),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 16, top: 12, left: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    constraints: BoxConstraints(
                      maxHeight: 40,
                    ),
                    filled: true,
                    fillColor: AppColors.lightGrey,
                    hintText: "Быстрый поиск",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                    )),
              )
            ],
          ),
        ));
  }
}
