import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uk_video_call/app/constants/color_config.dart';

class ButtonWithLabelWidgetView extends StatelessWidget {
  final image;
  final textColor;
  final title;
  final callback;
  final visibility;

  ButtonWithLabelWidgetView(
      {this.textColor,
      this.image,
      this.title,
      this.callback,
      this.visibility = true});

  @override
  Widget build(BuildContext context) {
    return (visibility)
        ? FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: callback,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: image,
                  width: 50.sp,
                  height: 50.sp,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: ColorConfig.BLACK,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        : Container();
  }
}
