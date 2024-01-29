import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { connected, disconnected }

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();

  ConnectionCubit() : super(ConnectionStatus.disconnected) {
    _checkConnectionStatus();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _checkConnectionStatus();
    });
  }

  Future<void> _checkConnectionStatus() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectionStatus.disconnected);
    } else {
      emit(ConnectionStatus.connected);
    }
  }
}
