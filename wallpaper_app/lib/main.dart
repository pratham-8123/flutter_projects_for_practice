import 'package:flutter/material.dart';
import 'package:wallpaper_app/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/extra/constants.dart';
import 'package:wallpaper_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WallpaperCubit()..getWallpapers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wall Print',
        theme: theme,
        home: const WallpaperScreen(),
      ),
    );
  }
}
