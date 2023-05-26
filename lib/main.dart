import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powermax/blocs/cart/cart_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:powermax/blocs/category/category_bloc.dart';
import 'package:powermax/repositories/category/category_repository.dart';
import 'screens/screens.dart';
import 'blocs/wishlist/wishlist_bloc.dart';

import 'config/app_router.dart';
import 'config/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerate,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
