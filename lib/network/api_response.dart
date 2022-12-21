import 'package:movie_flutter_test_app/network/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? error;

  ApiResponse(this.status, this.data);
  ApiResponse.init() : status = Status.INIT;
  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  @override
  String toString() {
    return "Status : $status  \n Data : $data";
  }
}
