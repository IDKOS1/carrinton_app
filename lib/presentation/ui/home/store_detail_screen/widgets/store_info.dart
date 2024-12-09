import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreInfoWidget extends StatelessWidget {
  final StoreInfo storeInfo;

  const StoreInfoWidget({super.key, required this.storeInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F2F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.asset(storeInfo.storeImage,
                  width: 120, height: 120, fit: BoxFit.cover),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_camera.svg',
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Edit Photo',
                      style: CustomStyle.boldBody(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(storeInfo.title,
                      style: CustomStyle.headMedium(color: mainColor)),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.location_on_sharp,
                          size: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(storeInfo.location,
                            style: CustomStyle.bodySmall()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.call,
                            size: 14,
                          )),
                      Expanded(
                        child: Text(
                          storeInfo.number,
                          style: CustomStyle.bodySmall(),
                          softWrap: true, // 자동 줄바꿈 허용
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Price : 100MYR',
                    textAlign: TextAlign.center,
                    style: CustomStyle.bodySmall(),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 400
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6C6C),
                      // 배경 색상
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Self Declaration Contract',
                      textAlign: TextAlign.center,
                      style: CustomStyle.boldBody(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Last VIsit Day : dd-mm-yy hh:mm')
                ]),
          )
        ],
      ),
    );
  }
}
