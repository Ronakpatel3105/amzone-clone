import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'constants/app_constants.dart';
import 'repositories/cart_repository.dart';
import 'repositories/product_repository.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: context.read<CartRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppConstants.primaryColor,
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppConstants.appBarColor,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
