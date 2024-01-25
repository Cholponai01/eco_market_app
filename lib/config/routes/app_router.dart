import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/features/cart/presentation/pages/cart/cart.dart';
import 'package:eco_market_app/features/cart/presentation/pages/cart/cart_page.dart';
import 'package:eco_market_app/features/cart/presentation/pages/cart/empty_cart_page.dart';
import 'package:eco_market_app/features/history/presentation/pages/history/history_page.dart';
import 'package:eco_market_app/features/history/presentation/pages/history/order_page.dart';
import 'package:eco_market_app/features/info/presentation/pages/info/info_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/home/home_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/main/main_page.dart';
import 'package:eco_market_app/features/search/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: InfoRoute.page),
        AutoRoute(page: PlaceanOrderRoute.page),
        AutoRoute(page: EmptyCartRoute.page),
        AutoRoute(page: OrderRoute.page),
      ];
}
