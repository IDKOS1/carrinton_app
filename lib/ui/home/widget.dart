import 'package:carrinton_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

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

class TimeSelector extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TimeSelector(
      {super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: middleGray),
        color: isSelected ? mainColor : Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : middleGray,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class StoreInformation extends StatelessWidget {
  final String title;
  final String location;
  final String number;
  final String operatingTime;
  final double distance;

  const StoreInformation({
    super.key,
    required this.title,
    required this.location,
    required this.number,
    required this.operatingTime,
    required this.distance
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/sample_store_image.png',
              width: 100,
              height: 100,
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(location),
                  Text(number),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(operatingTime),
                      Text('$distance')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
