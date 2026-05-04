import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_home_page/features/home/view-model/home_page_bloc.dart';
import 'package:instagram_home_page/my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomePageBloc())],
      child: MyApp(),
    ),
  );
}
