import 'package:carrinton_app/domain/entity/po/po_detail_entity.dart';
import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoInfoWidget extends StatelessWidget {
  final PoDetailEntity PoInfo;

  const PoInfoWidget({required this.PoInfo, super.key});

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
              Image.asset(PoInfo.mainImage,
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
                  Text(PoInfo.poName,
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
                        child: Text(PoInfo.address,
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
                          PoInfo.number,
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
                    'Price : ${PoInfo.price}MYR',
                    textAlign: TextAlign.center,
                    style: CustomStyle.bodySmall(),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 400),
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
