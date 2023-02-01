import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/router.dart';
import 'package:video_player/video_player.dart';

import '../size_config.dart';

class IntroVideo extends StatefulWidget {
  const IntroVideo({Key? key}) : super(key: key);

  @override
  State<IntroVideo> createState() => _IntroVideoState();
}

class _IntroVideoState extends State<IntroVideo>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController videoController;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
  }

  setupVideo() {
    videoController = VideoPlayerController.asset(SizeConfig.screenWidth > 720
        ? Assets.introVideoLandscape
        : Assets.introVideo);

    videoController
        .initialize()
        .then((value) => videoController.play().then((value) {
              videoController.addListener(() {
                if (videoController.value.position.inSeconds >
                    videoController.value.duration.inSeconds - 3) {
                  isPlaying = false;

                  navToLogin();
                }
              });
            }));
    isPlaying = true;
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (!isPlaying) setupVideo();

    return Scaffold(
        body: GestureDetector(
      onPanUpdate: (_) => navToLogin(),
      child: Stack(
        children: [
          VideoPlayer(
            videoController,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 64, horizontal: 36),
                child: TextButton(
                    child: Text(
                      "Swipe To Skip",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenHeight(20)),
                    ),
                    onPressed: navToLogin),
              ))
        ],
      ),
    ));
  }

  navToLogin() {
    navService.pushReplacementNamed(AppRouter.loginRoute);
  }
}
