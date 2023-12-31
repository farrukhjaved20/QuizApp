// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class BackgroundVideo extends StatefulWidget {
//   const BackgroundVideo({super.key});

//   @override
//   State<BackgroundVideo> createState() => _BackgroundVideoState();
// }

// class _BackgroundVideoState extends State<BackgroundVideo> {
//   late final VideoPlayerController videoController;
//   @override
//   void initState() {
//     videoController = VideoPlayerController.asset('assets/video.mp4')
//       ..initialize().then((value) {
//         videoController.play();
//         videoController.setLooping(true);
//       });
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext contex) => VideoPlayer(videoController);
//   @override
//   void dispose() {
//     super.dispose();
//     videoController.dispose();
//   }
// }
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatelessWidget {
  const BackgroundVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VideoPlayerController>(
      future: initializeVideoController(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final VideoPlayerController videoController = snapshot.data!;
          return VideoPlayer(videoController);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.asparagus,
            ),
          );
        }
      },
    );
  }

  Future<VideoPlayerController> initializeVideoController() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference videoRef = storage.ref().child('video/video.mp4');

    try {
      final String downloadUrl = await videoRef.getDownloadURL();
      final VideoPlayerController videoController =
          VideoPlayerController.networkUrl(Uri.parse(downloadUrl));
      await videoController.initialize();
      videoController.play();
      videoController.setLooping(true);
       return videoController;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing video controller: $e');
      }
      rethrow; // Propagate the error
    }
  }
}
