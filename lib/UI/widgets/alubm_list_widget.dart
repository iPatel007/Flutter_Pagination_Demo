import 'package:flutter/material.dart';
import 'package:flutter_visitroof_test/Core/bloc/album_bloc.dart';
import 'package:flutter_visitroof_test/Core/utilities/const.dart';
import 'package:flutter_visitroof_test/Core/utilities/utils.dart';
import 'package:flutter_visitroof_test/UI/widgets/bottom_loader_widget.dart';
import 'package:flutter_visitroof_test/UI/widgets/screen_message_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitroof_test/locator.dart';

class AlbumListWidget extends StatefulWidget {
  @override
  _AlbumListWidgetState createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  final _scrollController = ScrollController();
  final _albumState = locator<AlbumState>();

  @override
  void initState() {
    _scrollController.addListener(_scrollControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollControllerListener);
    _scrollController.dispose();
    super.dispose();
  }

  _scrollControllerListener() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      final _albumBloc = context.read<AlbumBloc>();
      if (_albumState is AlbumStateLoading || _albumBloc.userID >= PAGE_LENGTH)
        return;
      _albumBloc.userID++;
      _albumBloc.getAlbumList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
      if (state is AlbumStateLoading) {
        return Utils.loaderWidget();
      } else if (state is AlbumStateLoaded) {
        return listingWidget(context);
      } else {
        return ScreenMessageWidget(massage: SOMETHING_WENT_WRONG_MSG);
      }
    });
  }

  Widget listingWidget(BuildContext context) {
    final _albumBloc = context.read<AlbumBloc>();

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _albumBloc.listAlbum[index].title ?? NO_TITLE_FOUND,
                  style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                ),
              )),
            );
          },
          childCount: context.read<AlbumBloc>().listAlbum.length,
        )),
        BottomLoaderWidget()
      ],
    );
  }
}
