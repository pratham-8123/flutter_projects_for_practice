import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Story{
  final User user;
  final String? imageUrl;
  final bool isViewed;

  Story({required this.user, required this.imageUrl, this.isViewed = false});

}