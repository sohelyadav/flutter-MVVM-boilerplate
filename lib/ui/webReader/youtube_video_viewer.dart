import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/icon.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/safe_area.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoViewer extends StatefulWidget {
  @override
  _YoutubeVideoViewerState createState() => _YoutubeVideoViewerState();
}

class _YoutubeVideoViewerState extends State<YoutubeVideoViewer> {
  NavigationService _navigationService = locator<NavigationService>();
  @override
  void initState() {
    // FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String videoId = YoutubePlayer.convertUrlToId(widget.data!.videoUrl);
    return CustomScaffold(
      body: Container(
        color: kBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: kWhite,
              customBorder: CircleBorder(),
              onTap: () => _navigationService.back(),
              child: YourClassNameIcon(
                padding: kWidgetLPadding,
                icon: Icons.arrow_back,
                color: kWhite,
                size: 28,
              ),
            ),
            Expanded(
              child: YoutubePlayer(
                aspectRatio: 1.5,
                topActions: [
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () => _navigationService.back(),
                    child: YourClassNameIcon(
                      padding: kWidgetLPadding,
                      icon: Icons.arrow_back,
                      color: kBlack,
                      size: 28,
                    ),
                  ),
                ],
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: ProgressBarColors(playedColor: kPrimaryColor),
                  ),
                ],
                controller:
                    YoutubePlayerController(initialVideoId: "93SrJpoubbQ"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
