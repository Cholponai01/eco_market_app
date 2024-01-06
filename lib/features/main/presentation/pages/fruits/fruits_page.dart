// import 'package:auto_route/auto_route.dart';
// import 'package:eco_market_app/config/theme/app_colors.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
  // List<GridViewMenuItem> gridViewMenuItem = [];

  // @override
  // void initState() {
  //   super.initState();
  //   gridViewMenuItem = [
  //     GridViewMenuItem(
  //         image: "assets/images/products/apple.png",
  //         text: "Яблоко красная радуга сладкая",
  //         title: "56",
  //         subtitle: "c"),
  //     GridViewMenuItem(
  //         image: "assets/images/products/orange.png",
  //         text: "Апельсины сладкий пакистанский",
  //         title: "86",
  //         subtitle: "c"),
  //     GridViewMenuItem(
  //         image: "assets/images/products/pitaya.png",
  //         text: "Драконий фрукт",
  //         title: "340",
  //         subtitle: "c"),
  //     GridViewMenuItem(
  //         image: "assets/images/products/green_apple.png",
  //         text: "Яблоко золотая радуга",
  //         title: "56",
  //         subtitle: "c"),
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
    // void showFruitBottomSheet(GridViewMenuItem item) {
    //   showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return Container(
    //         // BottomSheet içeriği buraya gelecek
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Image.asset(item.image),
    //             const SizedBox(height: 12),
    //             Text(
    //               item.text,
    //               style: const TextStyle(
    //                   fontSize: 18, fontWeight: FontWeight.bold),
    //             ),
    //             const SizedBox(height: 8),
    //             RichText(
    //               text: TextSpan(
    //                 children: [
    //                   TextSpan(
    //                     text: item.title,
    //                     style: const TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppColors.green),
    //                   ),
    //                   TextSpan(
    //                     text: item.subtitle,
    //                     style: const TextStyle(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w700,
    //                         color: AppColors.green),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const Text(
    //               "Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.",
    //               style: TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.w500,
    //                   color: AppColors.darkGrey),
    //             ),
    //             const SizedBox(height: 24),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // Burada eklemek için özel işlemleri yapabilirsiniz
    //                 // Örneğin: Sepete ekleme işlemleri
    //                 Navigator.pop(context); // BottomSheet'i kapat
    //               },
    //               child: const Text("Добавить",
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   );
    // }

    // return Scaffold(
    //   appBar: AppBar(),
      // body: GridView.builder(
      //     shrinkWrap: true,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       mainAxisSpacing: 10.0,
      //     ),
      //     itemCount: gridViewMenuItem.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.only(left: 16, right: 16),
      //         child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: AppColors.lightGrey,
      //               borderRadius: BorderRadius.circular(16),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 4, right: 4),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Image.asset(gridViewMenuItem[index].image),
      //                   // const SizedBox(height: 14),
      //                    Text(
      //                     gridViewMenuItem[index].text,
      //                     style: const TextStyle(
      //                         fontSize: 14, fontWeight: FontWeight.w400),
      //                   ),
      //                   // const SizedBox(height: 24),
      //                   RichText(
      //                     text: TextSpan(
      //                       children: [
      //                         TextSpan(
      //                           text: gridViewMenuItem[index].title,
      //                           style: const TextStyle(
      //                               fontSize: 20,
      //                               fontWeight: FontWeight.w700,
      //                               color: AppColors.green),
      //                         ),
      //                         TextSpan(
      //                           text: gridViewMenuItem[index].subtitle,
      //                           style: const TextStyle(
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w700,
      //                               color: AppColors.green),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   // const SizedBox(height: 16),
      //                   ElevatedButton(
      //                     onPressed: () {
      //                       showFruitBottomSheet(gridViewMenuItem[index]);
      //                     },
      //                     child: const Text("Добавить",
      //                         style: TextStyle(
      //                             fontSize: 16, fontWeight: FontWeight.w500)),
      //                   ),
      //                 ],
      //               ),
      //             )),
      //       );
      //     }),
//     );
//   }
// }

// class GridViewMenuItem {
//   final String image;
//   final String text;
//   final String title;
//   final String subtitle;
//   final VoidCallback? onPressed;
//   GridViewMenuItem({
//     required this.image,
//     required this.text,
//     required this.title,
//     required this.subtitle,
//     this.onPressed,
//   });
// }
