import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/routes/app_router.dart';
import 'package:eco_market_app/config/theme/theme.dart';
import 'package:eco_market_app/features/cart/presentation/cubit/cubit/cart_screen_cubit.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/connection/cubit/connection_cubit.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/main_screen_cubit.dart';
import 'package:eco_market_app/features/main/presentation/pages/main/main_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/network/no_connection_page.dart';
import 'package:eco_market_app/features/search/presentation/cubit/cubit/search_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          create: (context) => di.sl<MainScreenCubit>()..getCategories(),
        ),
        BlocProvider<SearchScreenCubit>(
          create: (context) => di.sl<SearchScreenCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => di.sl<CartScreenCubit>()..getOrders(),
        ),
        BlocProvider(
          create: (context) => di.sl<ConnectionCubit>(),
        )
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: appRouter.config(),
          routerDelegate: AutoRouterDelegate(appRouter),
          routeInformationParser: appRouter.defaultRouteParser(),
         builder: (context, router, _) {
  return BlocBuilder<ConnectionCubit, ConnectionStatus>(
    builder: (context, state) {
      if (state == ConnectionStatus.connected) {
        return const MainPage();
      } else {
        return const NoConnectionPage();
      }
    },
  );
},),
    );
  }
}
