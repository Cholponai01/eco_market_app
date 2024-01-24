// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartPage(),
      );
    },
    EmptyCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyCartPage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    InfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    PlaceanOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceanOrderPage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchPage(
          key: args.key,
          id: args.id,
          fruits: args.fruits,
        ),
      );
    },
  };
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyCartPage]
class EmptyCartRoute extends PageRouteInfo<void> {
  const EmptyCartRoute({List<PageRouteInfo>? children})
      : super(
          EmptyCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoPage]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceanOrderPage]
class PlaceanOrderRoute extends PageRouteInfo<void> {
  const PlaceanOrderRoute({List<PageRouteInfo>? children})
      : super(
          PlaceanOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceanOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required int id,
    required List<String> fruits,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            id: id,
            fruits: fruits,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.id,
    required this.fruits,
  });

  final Key? key;

  final int id;

  final List<String> fruits;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, id: $id, fruits: $fruits}';
  }
}
