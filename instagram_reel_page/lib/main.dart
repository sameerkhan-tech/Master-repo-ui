import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_reel_page/app.dart';
import 'package:instagram_reel_page/features/reel/view-model/reel_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ReelBloc(),
    child: const MyApp()));
}
