import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';


// Ask about model how comment fit in.
class SingleReelItem extends StatefulWidget {
  final String video;
  final int likeCount;
  final int commentCount;
  final int saveCount;
  final String discription;

  const SingleReelItem({
    super.key,
    required this.video,
    required this.likeCount,
    required this.commentCount,
    required this.saveCount,
    required this.discription,
  });

  @override
  State<SingleReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<SingleReelItem> {
  late final VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.asset(widget.video)
      ..initialize().then((value) {
          
        // once video initilize then play
        // setState imp for trying rebuild after intialize
        // so that our condition recheck _player.value.isInitialize?
        // visibility detector it must for pausing the video 
        _playerController.setLooping(true);
        _playerController.play();
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.video),
      onVisibilityChanged: (info) {
        var visiblePercentage = info.visibleFraction * 100;
      
      if (visiblePercentage > 80) {
        // If more than 80% of the video is visible, play it
        if (_playerController.value.isInitialized) {
           _playerController.play();
        }
      } else {
        // If the user scrolled away, pause it immediately
        if (_playerController.value.isInitialized) {
          _playerController.pause();
        }
      }
      },
      child: Scaffold(
        body: Stack(
          children: [
            (_playerController.value.isInitialized)
                ? VideoPlayer(_playerController)
                : Center(child: Container(color: Colors.black)),
            Positioned(
              right: 0,
              bottom: 80,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  Text(widget.likeCount.toString()),
                  SizedBox(height: 16),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.comment_bank_outlined),
                  ),
                  Text(widget.commentCount.toString()),
                  SizedBox(height: 16),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.save_alt_outlined),
                  ),
                  Text(widget.saveCount.toString()),
                  SizedBox(height: 16),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
                ],
              ),
            ),
      
            Positioned(left: 16, bottom: 40, child: Text(widget.discription)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }
}
