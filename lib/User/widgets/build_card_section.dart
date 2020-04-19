import 'package:AdsApp/User/Models/Ads.dart';
import 'package:AdsApp/User/widgets/build_card_section_info.dart';
import 'package:flutter/material.dart';

class BuildCardSection extends StatelessWidget {
  Ads ads;

  BuildCardSection(this.ads);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        alignment: Alignment(0.0, 0.8),
        children: <Widget>[
          BuildCardSectionInfo(ads),
        ],
      ),
    );
  }

}