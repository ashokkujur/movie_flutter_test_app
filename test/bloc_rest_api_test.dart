import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_flutter_test_app/bloc/movie/movie_bloc.dart';
import 'package:movie_flutter_test_app/bloc/movie/movie_state.dart';
import 'package:movie_flutter_test_app/models/movie_model.dart';

void main() {
  group("movie api test", () {
    late MovielistCubit movielistCubit;
    setUp(() {
      movielistCubit = MovielistCubit();
    });
    blocTest<MovielistCubit, MovieState>("test movie response",
        build: () => movielistCubit,
        act: (movie) {
          movie.getMovies();
        },
        expect: () => [movielistCubit.state]);
    tearDown(() {
      movielistCubit.close();
    });
  });
}
