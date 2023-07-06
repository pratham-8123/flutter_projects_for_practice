import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Material(
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
          : null,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(
                    imageUrl: currentUser.imageUrl!,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'What\'s on your mind ?'),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              SizedBox(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      // ignore: avoid_print
                      onPressed: () => print('Live'),
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: const Text('Live'),
                    ),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    TextButton.icon(
                      // ignore: avoid_print
                      onPressed: () => print('Photo'),
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: const Text('Photo'),
                    ),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    TextButton.icon(
                      // ignore: avoid_print
                      onPressed: () => print('Room'),
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: const Text('Room'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
