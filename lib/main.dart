import 'package:api/cash/cash_helper.dart';
import 'package:api/core/api/dio_consumer.dart';
import 'package:api/cubit/user_cubit.dart';
import 'package:api/repostries/user_repostry.dart';
import 'package:api/screens/signin_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(
        UserRepositry(
          apiConsumer: DioConsumer(
            dio: Dio(),
          ),
        ),
      ),
      child: const ApiApp(),
    ),
  );
}

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
