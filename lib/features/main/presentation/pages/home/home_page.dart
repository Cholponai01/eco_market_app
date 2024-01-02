import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GridMenuItem> gridMenuItems = [];

  @override
  void initState() {
    super.initState();
    gridMenuItems = [
      GridMenuItem(
        image: "assets/images/main/fruits.png",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/driedFruits.png",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/vegetables.png",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/greenery.png",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/teaCoffee.png",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/lactic.png",
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Эко Маркет")),
        ),
        body: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: gridMenuItems.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16, top: 18, left: 16),
                  child: GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(gridMenuItems[index].image),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class GridMenuItem {
  final String image;
  final VoidCallback onTap;

  GridMenuItem({required this.image, required this.onTap});
}
