import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotifyclone/common/widgets/list_shimmer/list_shimmer.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotifyclone/presentation/home/bloc/play_list_state.dart';
import 'package:spotifyclone/presentation/song_player/pages/song_player.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: ListShimmer(),
            );
          }
          if (state is PlayListLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _songs(state.songs)
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.darkGrey
                            : const Color(0xFFE6E6E6),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xFF959595)
                            : const Color(0xFF555555),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          child: Text(
                            songs[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          songs[index].artist,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      songs[index].duration.toString().replaceAll(".", ":"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 24),
                    FavoriteButton(songEntity: songs[index]),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 24);
        },
        itemCount: songs.length);
  }
}
