import 'package:flutter/material.dart';

import 'package:start_up/data/colors.dart';
import 'package:start_up/data/data.dart';

import 'package:start_up/widgets/video_recommendation_card.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainComponentsGrey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var recommendationsPosition = 0;
                recommendationsPosition < recommendations.length;
                recommendationsPosition++) ...{
              VideoRecommendation(recommendations[recommendationsPosition]),
            },
          ],
        ),
      ),
    );
  }
}
