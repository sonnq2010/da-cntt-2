import 'package:flutter/material.dart';
import 'package:frontend/service/webrtc_service.dart';
import 'package:frontend/widgets/video_view/video_view.dart';

class MyVideoView extends StatelessWidget {
  const MyVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoView(videoRenderer: WebRTCService.I.myVideoRenderer);
  }
}
