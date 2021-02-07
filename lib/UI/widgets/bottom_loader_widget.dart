import 'package:flutter/material.dart';
import 'package:flutter_visitroof_test/Core/bloc/album_bloc.dart';
import 'package:flutter_visitroof_test/Core/utilities/const.dart';
import 'package:flutter_visitroof_test/Core/utilities/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomLoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _albumBloc = context.read<AlbumBloc>();

    return  SliverToBoxAdapter(
        child: Container(
          alignment: Alignment.center,
          height: _albumBloc.userID >= PAGE_LENGTH ? 1 : 80,
          child:  _albumBloc.userID >= PAGE_LENGTH ? Container() : Utils.loaderWidget(),
        ));
  }
}
