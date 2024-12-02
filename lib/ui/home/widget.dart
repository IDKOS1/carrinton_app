import 'package:carrinton_app/models/StoreInfo.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 원형 프로그래스바
class CircleProgressBar extends StatefulWidget {
  const CircleProgressBar({super.key});

  @override
  State<CircleProgressBar> createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      width: 90,
      height: 90,
      child: DashedCircularProgressBar.aspectRatio(
        aspectRatio: 1,
        // width ÷ height
        valueNotifier: _valueNotifier,
        progress: 33,
        startAngle: 180,
        sweepAngle: 360,
        foregroundColor: Color(0xFF79B12B),
        backgroundColor: const Color(0xffeeeeee),
        foregroundStrokeWidth: 10,
        backgroundStrokeWidth: 7,
        animation: true,
        child: Center(
          child: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (_, double value, __) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${value.toInt()}%',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 12),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}

class LoadAmount extends StatelessWidget {
  final String title;
  final int amount;

  const LoadAmount({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Text('$amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF4C4B4B), fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

class MediumTextBox extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;

  const MediumTextBox(
      {super.key,
      required this.title,
      this.backgroundColor = Colors.white,
      this.textColor = middleGray,
      this.borderColor = middleGray,
      this.padding = const EdgeInsets.all(10)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16, color: textColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class StoreInformation extends StatelessWidget {
  final StoreInfo storeInfo;
  final VoidCallback onPressed;

  const StoreInformation(
      {super.key, required this.storeInfo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                storeInfo.storeImage,
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeInfo.title,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // 상단 정렬
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            'assets/icons/icon_location.svg',
                            width: 14,
                            height: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            storeInfo.location,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true, // 자동 줄바꿈 허용
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            'assets/icons/icon_call.svg',
                            width: 14,
                            height: 14,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            storeInfo.number,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true, // 자동 줄바꿈 허용
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          storeInfo.operatingTime,
                          style: TextStyle(
                            color: Color(0xFF232C3A),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${storeInfo.distance} km',
                          style: TextStyle(
                            color: Color(0xFFA9A5B8),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
