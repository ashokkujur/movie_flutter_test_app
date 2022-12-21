import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_test_app/bloc/movie/movie_bloc.dart';
import 'package:movie_flutter_test_app/models/movie_model.dart';
import 'package:movie_flutter_test_app/network/status.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../assets/images.dart';
import '../../bloc/movie/movie_state.dart';
import '../../constant/constant.dart';
import '../../styles/app_colors.dart';
import '../../styles/app_theme.dart';
import '../../styles/text_style.dart';
import '../../widgets/loading_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final TextEditingController _controllerFilter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 0.0,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
            ),
            backgroundColor: Colors.white,
            body: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: BlocBuilder<MovielistCubit, MovieState>(
                    builder: (ccontext, movieState) {
                  if (movieState.response.status == Status.INIT) {
                    ccontext.read<MovielistCubit>().getMovies();
                  }
                  _controllerFilter.addListener(() {
                    context
                        .read<MovielistCubit>()
                        .filter(_controllerFilter.text);
                  });
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppBar().preferredSize.height,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Hello, ",
                            style: AppTextStyle.size24ColorBlack,
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                          child: Text(
                            "New test user",
                            style: AppTextStyle.size18ColorBlack,
                          )),
                      Expanded(
                          child: movieState.response.status == Status.COMPLETED
                              ? ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: movieState.response.data.length,
                                  itemBuilder: ((context, index) =>
                                      GestureDetector(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                "https://www.themoviedb.org/movie/${(movieState.response.data[index] as MovieModel).id}-${(movieState.response.data[index] as MovieModel).title.toLowerCase().replaceAll(':', '').replaceAll(' ', '-')}"));
                                          },
                                          child: Column(children: [
                                            if (index == 0)
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.0,
                                                      right: 20.0,
                                                      top: 10.0,
                                                      bottom: 20.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _controllerFilter,
                                                    decoration: InputDecoration(
                                                        suffixIcon: Icon(
                                                          Icons.search,
                                                          color: Colors.grey,
                                                        ),
                                                        hintText:
                                                            "Search movie",
                                                        disabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    100.0)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    100.0)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    100.0))),
                                                  )),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FadeInImage.assetNetwork(
                                                      placeholder: AppImages
                                                          .imgPlaceHolder,
                                                      imageErrorBuilder:
                                                          (context, error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                        AppImages
                                                            .imgPlaceHolder,
                                                      ),
                                                      image:
                                                          "https://image.tmdb.org/t/p/w500/${(movieState.response.data[index] as MovieModel).backdropPath}",
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(children: [
                                                      Expanded(
                                                          child: Text(
                                                        (movieState.response
                                                                    .data[index]
                                                                as MovieModel)
                                                            .title,
                                                        style: AppTextStyle
                                                            .size20ColorWhite,
                                                      )),
                                                      const Icon(
                                                        Icons.star_rate,
                                                        color: Colors.yellow,
                                                      ),
                                                      Text(
                                                          " ${(movieState.response.data[index] as MovieModel).voteAverage.toStringAsFixed(2)}")
                                                    ]),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "Release date: ${(movieState.response.data[index] as MovieModel).releaseDate}",
                                                      style: AppTextStyle
                                                          .size14Colorprimary,
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      " ${(movieState.response.data[index] as MovieModel).overview}",
                                                      style: AppTextStyle
                                                          .size18Colorblack,
                                                    )
                                                  ],
                                                )),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            const Divider(
                                              height: 2.0,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            )
                                          ]))))
                              : Container(
                                  child: AppLoadingWhiteWidget(),
                                ))
                    ],
                  );
                }))));
  }
}
