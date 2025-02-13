import 'package:flutter/material.dart';
import 'package:hamneshin.games.apps/gen/fonts.gen.dart';

import '../utils/constants/app_distances.dart';
import '../utils/constants/ui_colors.dart';

class HomeGamesCards extends StatelessWidget {
  final String btnText;
  final String imageAsset;
  final Function onPress;
  const HomeGamesCards({
    super.key,
    required this.btnText,
    required this.onPress,
    required this.imageAsset,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3.5,
      child: Column(
        children: [
          SizedBox(
            height: size.width / 3,
            child: Container(
              decoration: BoxDecoration(
                color: UiColors.darkBlueColor3,
                borderRadius: BorderRadius.circular(AppDistances.large),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: UiColors.lightBlueColor,
                  borderRadius: BorderRadius.circular(AppDistances.large),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDistances.large),
                      ),
                      backgroundColor: UiColors.lightBlueColor3,
                    ),
                    onPressed: () => onPress(),
                    child: Image.asset(
                      imageAsset,
                      width: size.width / 3,
                      height: size.width / 3,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          Text(
            btnText,
            style: const TextStyle(
                fontFamily: FontFamily.pelak,
                color: UiColors.whiteColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
