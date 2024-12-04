import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                width: 16,
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
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
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
                      ),
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
