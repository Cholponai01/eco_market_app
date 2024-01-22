import 'package:eco_market_app/config/routes/app_router.dart';
import 'package:eco_market_app/config/theme/theme.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/main_screen_cubit.dart';
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
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
