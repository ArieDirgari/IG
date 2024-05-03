import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IGreels extends StatefulWidget {
  const IGreels({super.key});

  @override
  State<IGreels> createState() => _IGreelsState();
}

class _IGreelsState extends State<IGreels> {
  
  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState(){
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      Center(
        child: Stack(
          children: [],
        ),

      )
    );
  }
}