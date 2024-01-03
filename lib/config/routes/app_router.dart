import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:eco_market_app/features/main/presentation/pages/dried_fruits/dried_fruits_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/fruits/fruits_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/greenery/greenery_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/home/home_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/lactic/lactic_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/tea_coffee/tea_coffee_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/vegetables/vegetables_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [];
}
