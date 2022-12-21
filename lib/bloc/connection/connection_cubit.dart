import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_flutter_test_app/bloc/connection/connection_state.dart';

import '../../enum/network_enum.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit()
      : super(ConnectionState(connectionStatus: ConnectionStatus.CONNECTED)) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(ConnectionState(connectionStatus: ConnectionStatus.CONNECTED));
          break;
        case InternetConnectionStatus.disconnected:
          emit(ConnectionState(connectionStatus: ConnectionStatus.NOCONNCTION));
          break;
      }
    });
  }
}
