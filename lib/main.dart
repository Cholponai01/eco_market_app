import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/routes/app_router.dart';
import 'package:eco_market_app/config/theme/app_colors.dart';
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
  SystemChrome.setSystemUIOverlayStyle();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          create: (context) => di.sl<MainScreenCubit>()..getCategories(),
        ),
        BlocProvider<SearchScreenCubit>(
            create: (context) => di.sl<SearchScreenCubit>()..getProducts()),
        BlocProvider<CartScreenCubit>(
            create: (context) => di.sl<CartScreenCubit>()..getOrders()),
        BlocProvider<ConnectionCubit>(
            create: (context) => di.sl<ConnectionCubit>()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ConnectionCubit, ConnectionStatus>(
            builder: (context, state) {
          if (state == ConnectionStatus.connected) {
            return const MainPage();
          } else {
            return const NoConnectionPage();
          }
        }),
      ),
    );
  }
}
