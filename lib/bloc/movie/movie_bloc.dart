import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_test_app/bloc/movie/movie_state.dart';
import 'package:movie_flutter_test_app/models/movie_model.dart';
import 'package:movie_flutter_test_app/network/status.dart';
import 'package:movie_flutter_test_app/repository/movie_repository.dart';

import '../../network/api_response.dart';
import '../response_error_handler.dart';

class MovielistCubit extends Cubit<MovieState> {
  MovielistCubit() : super(MovieState(response: ApiResponse(Status.INIT, [])));
  List<MovieModel> movies = [];

  getMovies() async {
    emit(state.copyWith(response: ApiResponse(Status.LOADING, [])));
    try {
      dynamic response = await MovieRepository().getMovie();
      movies = response.data["results"].map<MovieModel>((json) {
        return MovieModel.fromJson(json);
      }).toList();

      emit(state.copyWith(response: ApiResponse(Status.COMPLETED, movies)));
    } catch (e) {
      emit(state.copyWith(
          response: ApiResponse(
              Status.ERROR,
              ResponseErrorHandler().errorMessage(
                  (e as DioError).response!.statusCode!,
                  message: e.response!.data["message"]))));
    }
  }

  filter(String filter) {
    if (filter.isNotEmpty) {
      List<MovieModel> moviesFilter = movies
          .where((element) =>
              element.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
      if (moviesFilter.isNotEmpty) {
        emit(state.copyWith(
            response: ApiResponse(Status.COMPLETED, moviesFilter)));
      }
    } else {
      emit(state.copyWith(response: ApiResponse(Status.COMPLETED, movies)));
    }
  }
}
