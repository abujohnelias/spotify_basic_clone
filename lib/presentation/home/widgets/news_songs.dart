// import 'dart:developer';

// import 'package:figma_squircle/figma_squircle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spotifyclone/core/configs/constants/app_urls.dart';
// import 'package:spotifyclone/domain/entities/song/song.dart';
// import 'package:spotifyclone/presentation/home/bloc/news_songs_cubit.dart';
// import 'package:spotifyclone/presentation/home/bloc/news_songs_state.dart';

// class NewsSongs extends StatelessWidget {
//   const NewsSongs({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => NewsSongsCubit()..getNewsSongs(),
//       child: SizedBox(
//           height: 200,
//           child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
//             builder: (context, state) {
//               if (state is NewsSongsLoading) {
//                 log("progress indicator");
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (state is NewsSongsLoaded) {
//                 log("that");
//                 return _songs(state.songs);
//               }
//               log("last");
//               return Container();
//             },
//           )),
//     );
//   }

//   Widget _songs(List<SongEntity> songs) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return SizedBox(
//           width: 160,
//           child: Column(
//             children: [
//               Container(
//                 decoration: ShapeDecoration(
//                   shape: SmoothRectangleBorder(
//                     borderRadius: SmoothBorderRadius(
//                       cornerRadius: 8,
//                       cornerSmoothing: 1,
//                     ),
//                   ),
//                   image: const DecorationImage(image: NetworkImage(AppUrls.fireStorage + songs[index].title + ))
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const SizedBox(width: 14);
//       },
//       itemCount: songs.length,
//     );
//   }
// }

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/core/configs/constants/app_urls.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotifyclone/presentation/song_player/pages/song_player.dart';

import '../../../domain/entities/song/song.dart';
import '../bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return _shimmer();
              }

              if (state is NewsSongsLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _songs(state.songs),
                );
              }

              return Container();
            },
          )),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SongPlayerScreen(songEntity: songs[index]),
                ),
              );
            },
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: ShapeDecoration(
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 16,
                              cornerSmoothing: 1,
                            ),
                          ),
                          // image: DecorationImage(
                          // fit: BoxFit.cover,
                          // image: NetworkImage(
                          //   '${AppURLs.coverfireStorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}' ,
                          // ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              AppURLs.defaultSongCover,
                            ),
                          )
                          // ),
                          ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(10, 10, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode
                                  ? AppColors.darkGrey
                                  : const Color(0xffE6E6E6)),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode
                                ? const Color(0xff959595)
                                : const Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      songs[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  Text(
                    songs[index].artist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 2),
        itemCount: songs.length);
  }

  Widget _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.black12,
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 16,
                cornerSmoothing: 1,
              ),
            ),
          ),
          height: 200.0,
        ),
      ),
    );
  }
}
