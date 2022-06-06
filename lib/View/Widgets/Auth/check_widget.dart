import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Logic/Controllers/auth_controller.dart';
import 'package:shop/Utils/theme.dart';
import 'package:shop/View/Widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Image.asset('assets/images/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: 'I accept ',
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
              ),
              TextUtils(
                text: 'terms & conditions',
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
                textDecoration: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
