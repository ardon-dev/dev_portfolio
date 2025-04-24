import 'dart:ui';

import 'package:flutter/material.dart';

class FullscreenDialog extends StatelessWidget {
  final String image;
  const FullscreenDialog({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.transparent),
              ),
            ),

            Center(
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 5,
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            Positioned(
              top: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
