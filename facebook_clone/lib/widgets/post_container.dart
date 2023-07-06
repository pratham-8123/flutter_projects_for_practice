import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  post.imageUrl != 'null'
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ],
              ),
            ),
            post.imageUrl != 'null'
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CachedNetworkImage(imageUrl: post.imageUrl!))
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl!),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}  •  ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey.shade600,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          // ignore: avoid_print
          onPressed: () => print('More'),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  '${post.likes} Likes',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${post.shares} Shares',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                  icon: Icon(MdiIcons.thumbUpOutline,
                      color: Colors.grey.shade600, size: 20),
                  label: 'Like',
                  // ignore: avoid_print
                  onTap: () => print('Like')),
              _PostButton(
                  icon: Icon(MdiIcons.commentOutline,
                      color: Colors.grey.shade600, size: 20),
                  label: 'Comment',
                  // ignore: avoid_print
                  onTap: () => print('Comment')),
              _PostButton(
                  icon: Icon(MdiIcons.shareOutline,
                      color: Colors.grey.shade600, size: 25),
                  label: 'Share',
                  // ignore: avoid_print
                  onTap: () => print('Share')),
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function()? onTap;

  const _PostButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
