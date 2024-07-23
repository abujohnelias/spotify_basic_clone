import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotifyclone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  final String? onScreenName;
  const FavoriteButton({
    super.key,
    required this.songEntity,
    this.onScreenName,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);

                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                songEntity.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color: songEntity.isFavorite
                    ? AppColors.primary
                    : AppColors.darkGrey,
                size: onScreenName == "songPlayerScreen" ? 35 : 25,
              ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color:
                    state.isFavorite ? AppColors.primary : AppColors.darkGrey,
                size: onScreenName == "songPlayerScreen" ? 35 : 25,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
