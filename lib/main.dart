import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_test_app/routes/app_route_names.dart';
import 'package:movie_flutter_test_app/routes/app_router.dart';

import 'bloc/connection/connection_cubit.dart';
import 'enum/network_enum.dart';
import 'bloc/connection/connection_state.dart' as connectionState;

void main() {
  runApp(AppProvider());
}

class AppProvider extends MaterialApp {
  /// {@macro ticker_app}
  AppProvider({super.key})
      : super(
            debugShowCheckedModeBanner: false,
            home: MultiBlocProvider(
                providers: [
                  BlocProvider<ConnectionCubit>(
                    create: (BuildContext context) => ConnectionCubit(),
                  ),
                ],
                child: BlocConsumer<ConnectionCubit,
                        connectionState.ConnectionState>(
                    builder: ((context, state) => MyApp()),
                    listener: (context, state) {
                      if (state.connectionStatus ==
                          ConnectionStatus.NOCONNCTION) {
                        Navigator.pushNamed(
                            context, AppRouterNames.connectionError);
                      }
                    })));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }
}
