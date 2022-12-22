import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_flutter_test_app/models/movie_model.dart';

import '../../network/api_response.dart';

class MovieState {
  ApiResponse response;
  MovieState({required this.response});
  MovieState copyWith({required ApiResponse response}) {
    return MovieState(response: response);
  }

  List<Object> get pros => [...response.data];
}
