import 'package:dio/dio.dart';
import 'package:movie_flutter_test_app/network/base_api_service.dart';
import 'package:movie_flutter_test_app/network/endpoint.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    Response responseJson = await Dio().get(AppApies.baseUrl + url,
        options: Options(
          contentType: 'application/json',
        ));
    return responseJson;
  }
}
