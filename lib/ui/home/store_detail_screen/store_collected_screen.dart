import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:carrinton_app/ui/home/store_detail_screen/widgets/new_jerry_can_list.dart';
import 'package:flutter/material.dart';

class CollectedScreen extends StatelessWidget {
  const CollectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO
    /// ui 확인용 임시 더미데이터
    /// riverpod로 데이터 상태 관리
    final newCanList = [
      'S.124',
      'S.12345',
      'S.643',
      'S.12',
      'S.6256',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weight(kg)',
                  style:
                      CustomStyle.headMedium(color: const Color(0xFF0B373D))),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      '25',
                      style: CustomStyle.headMedium(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount',
                  style:
                      CustomStyle.headMedium(color: const Color(0xFF0B373D))),
              Text('2,500 MYR',
                  style: CustomStyle.headMedium(color: mainColor)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text('New Jerry can number at the shop',
              style: CustomStyle.bodyMedium()),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      '+ Add',
                      style: CustomStyle.headMedium(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          NewJerryCanList(canList: newCanList)
        ],
      ),
    );
  }
}
