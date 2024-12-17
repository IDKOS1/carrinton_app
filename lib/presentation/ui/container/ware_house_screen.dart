import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/home/Po_detail_screen/widgets/signature.dart';
import 'package:carrinton_app/presentation/ui/login/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/sample_Po_image.png'),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CARRINGTON #1',
                            style: CustomStyle.headMedium(color: AppColors.mainColor),
                          ),
                          Text(
                            'Warehouse',
                            style: CustomStyle.bodySmall(color: AppColors.mainColor),
                          ),
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // 상단 정렬
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
                              const Expanded(
                                child: Text(
                                  '22, Jalan Sri Hartamas 8, Taman Sri Hartamas,',
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Text(
                    'Weight(kg)',
                    style: CustomStyle.headMedium(),
                  )),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    '25',
                    textAlign: TextAlign.end,
                    style: CustomStyle.headMedium(),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Signature(description: 'After checking\nPlease sign the PO.'),
          const SizedBox(height: 16),
          LargeButton(buttonText: 'WAREHOUSE UNLOADING', onPressed: () {}),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
