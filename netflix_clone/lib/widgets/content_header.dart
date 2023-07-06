import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent: featuredContent));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: 'List',
                  // ignore: avoid_print
                  onTap: () => print('My List')),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  // ignore: avoid_print
                  onTap: () => print('Info'))
            ],
          ),
        )
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({super.key, required this.featuredContent});

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController? _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    _videoController!.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController!.value.isPlaying
          ? _videoController?.pause()
          : _videoController?.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController!.value.isInitialized
                ? _videoController!.value.aspectRatio
                : 2.344,
            child: _videoController!.value.isInitialized
                ? VideoPlayer(_videoController!)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: AspectRatio(
              aspectRatio: _videoController!.value.isInitialized
                  ? _videoController!.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(2, 4),
                            blurRadius: 6)
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    _MoreInfoButton(),
                    const SizedBox(
                      width: 20,
                    ),
                    if (_videoController!.value.isInitialized)
                      IconButton(
                        icon:
                            Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController!.setVolume(100)
                              : _videoController!.setVolume(0);
                          _isMuted = _videoController!.value.volume == 0;
                        }),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                2.0), // Set the border radius to 0 for a rectangle shape
          ),
        ),
        padding: !Responsive.isDesktop(context)
            ? MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
              )
            : MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
              ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      // ignore: avoid_print
      onPressed: () => print('Play'),
      icon: const Icon(Icons.play_arrow, size: 30.0, color: Colors.black,),
      label: const Text(
        'Play',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MoreInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                2.0), // Set the border radius to 0 for a rectangle shape
          ),
        ),
        padding: !Responsive.isDesktop(context)
            ? MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
        )
            : MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      // ignore: avoid_print
      onPressed: () => print('More Info'),
      icon: const Icon(Icons.info_outline, size: 30.0, color: Colors.black,),
      label: const Text(
        'More Info',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

