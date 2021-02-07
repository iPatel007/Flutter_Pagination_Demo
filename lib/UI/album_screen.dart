import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitroof_test/Core/bloc/album_bloc.dart';
import 'package:flutter_visitroof_test/UI/widgets/alubm_list_widget.dart';

class AlbumListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album List'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => AlbumBloc(),
        child: AlbumListWidget(),
      )
    );
  }
}
