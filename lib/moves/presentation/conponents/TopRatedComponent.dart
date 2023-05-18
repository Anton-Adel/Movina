import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movina/moves/presentation/controller/Movies_State.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constatnts.dart';
import '../../../core/utls/dummy.dart';
import '../../../core/utls/enums.dart';
import '../controller/Movies_Bloc.dart';
class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous, current) => previous.TopRatedState!=current.TopRatedState,

      builder: (context,state){
        switch(state.TopRatedState)
        {
          case RequestStates.loading:
            return const  SizedBox(
                height: 170,
                child: Center(child: CircularProgressIndicator()));
          case RequestStates.loaded:
             return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.moviesTopRated.length,
                itemBuilder: (context, index) {
                  final movie = state.moviesTopRated[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {

                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstant.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
          case RequestStates.error:
            return const SizedBox(
                height: 170,
                child: Center(child: Text("Error")));

        }

      },
         );
  }
}
