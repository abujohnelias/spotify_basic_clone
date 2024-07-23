import 'dart:developer';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotifyclone/core/configs/constants/app_urls.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotifyclone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerScreen extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerScreen({
    super.key,
    required this.songEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()
          ..loadSong(
              '${AppURLs.songfireStorage}${songEntity.title.replaceAll(" ", "%20")}.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 16),
              _songDetail(context),
              const SizedBox(height: 32),
              _songPlayer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 1,
            ),
          ),
          // image: DecorationImage(
          // fit: BoxFit.cover,
          // image: NetworkImage(
          //   '${AppURLs.coverfireStorage}${songEntity[index].artist} - ${songEntity[index].title}.jpg?${AppURLs.mediaAlt}' ,
          // ),
          image: const DecorationImage(
            image: NetworkImage(AppURLs.defaultSongCover),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _songDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text(
                    songEntity.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Text(
                  songEntity.artist,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
        FavoriteButton(
          songEntity: songEntity,
          onScreenName: "songPlayerScreen",
        ),
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(fomatDuration(
                      context.read<SongPlayerCubit>().songPosition)),
                  Text(fomatDuration(
                      context.read<SongPlayerCubit>().songDuration)),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    context.read<SongPlayerCubit>().audioPlayer.playing
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                  ),
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  String fomatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
