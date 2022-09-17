import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uk_video_call/app/constants/color_config.dart';

class ButtonWidgetView extends GetView {
  final title;
  final callback;
  final width;
  final height;
  final margin;
  final focusNode;
  final padding;
  final fontSize;
  final fontColor;
  final color;
  final isOutlineStyle;
  final icon;
  final style;

  ButtonWidgetView(
      {this.fontSize,
      this.icon,
      this.fontColor,
      this.focusNode,
      this.color,
      this.margin = EdgeInsets.zero,
      this.padding: EdgeInsets.zero,
      this.width = double.infinity,
      this.height,
      this.isOutlineStyle = false,
      this.title,
      this.callback,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: (height == null) ? 50.h : height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            onTap: () {
              callback();
            },
            child: Ink(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  color: (color == null) ? ColorConfig.ACCENT_COLOR : color,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: (icon != null)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: (fontSize == null) ? 20.sp : fontSize,
                              fontWeight: FontWeight.bold,
                              color: (fontColor == null)
                                  ? ColorConfig.WHITE_COLOR
                                  : fontColor)),
                      (icon != null) ? icon : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
