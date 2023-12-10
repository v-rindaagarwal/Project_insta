import 'package:flutter/material.dart';
import 'package:start_up/data/data.dart';
import 'package:start_up/widgets/app_bar.dart';
import 'package:start_up/widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = homeScreenVideos[index];
                    return VideoCard(video: video);
                  },
                  childCount: homeScreenVideos.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
