import 'package:movie_flutter_test_app/network/endpoint.dart';

import '../network/base_api_service.dart';
import '../network/network_api_service.dart';

class MovieRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> getMovie() async {
    return await _apiService.getResponse(AppApies.popularUrl);
  }
}
