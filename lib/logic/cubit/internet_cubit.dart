import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/logic/cubit/internet_state.dart';
import '../../constants/enum.dart';


class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubcription;
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectionStream();
  }

  void connectionStream() {
     connectivityStreamSubcription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      }
      else if(result==ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.mobile);
      }
      else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
