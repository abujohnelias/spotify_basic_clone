import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotifyclone/common/widgets/list_shimmer/list_shimmer.dart';
import 'package:spotifyclone/core/configs/constants/app_urls.dart';
import 'package:spotifyclone/presentation/profile/bloc/favorite_songs_cubit.dart';
import 'package:spotifyclone/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotifyclone/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotifyclone/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotifyclone/presentation/song_player/pages/song_player.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text("Profile"),
        backgroundColor:
            context.isDarkMode ? const Color(0xFF2C2B2B) : Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileInfo(context),
            const SizedBox(height: 32),
            _favoriteSongs(),
          ],
        ),
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.3,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: context.isDarkMode ? const Color(0xFF2C2B2B) : Colors.white,
          shape: const SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.vertical(
              bottom: SmoothRadius(
                cornerRadius: 60,
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is ProfileInfoLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 30,
                          cornerSmoothing: 1,
                        ),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          state.userEntity.imageURL!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(state.userEntity.email!),
                  Text(
                    state.userEntity.fullName!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              );
            }

            if (state is ProfileInfoLoadingFailure) {
              return const Text('Please try again');
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _favoriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FAVORITE SONGS',
            ),
            const SizedBox(height: 20),
            BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
              builder: (context, state) {
                if (state is FavoriteSongsLoading) {
                  return const ListShimmer();
                }
                if (state is FavoriteSongsLoaded) {
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
                                    SongPlayerScreen(
                                  songEntity: state.favoriteSongs[index],
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: ShapeDecoration(
                                      color: context.isDarkMode
                                          ? const Color(0xFF2C2B2B)
                                          : Colors.white,
                                      shape: const SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.all(
                                          SmoothRadius(
                                            cornerRadius: 10,
                                            cornerSmoothing: 1,
                                          ),
                                        ),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppURLs.defaultSongCover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          state.favoriteSongs[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.favoriteSongs[index].artist,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.favoriteSongs[index].duration
                                      .toString()
                                      .replaceAll('.', ':')),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  FavoriteButton(
                                    songEntity: state.favoriteSongs[index],
                                    key: UniqueKey(),
                                    function: () {
                                      context
                                          .read<FavoriteSongsCubit>()
                                          .removeSong(index);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: state.favoriteSongs.length);
                }
                if (state is FavoriteSongsLoadingFailure) {
                  return const Text('Please try again.');
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
