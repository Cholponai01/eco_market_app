import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/features/main/presentation/pages/fruits/fruits_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/home/home_page.dart';
import 'package:eco_market_app/features/search/presentation/pages/search/search_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
      ];
}
