import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Logic/Controllers/auth_controller.dart';
import 'package:shop/Logic/Controllers/theme_controller.dart';
import 'package:shop/Utils/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ThemeController().changesTheme();
            },
            child: Text(
              'Dark Mode',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<AuthController>(
            builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Logout From App',
                    titleStyle: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        fontWeight: FontWeight.bold),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: TextStyle(
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: 'No',
                    cancelTextColor: Get.isDarkMode ? darkGreyClr : Colors.white,
                    textConfirm: 'Yes',
                    confirmTextColor: Get.isDarkMode ? darkGreyClr : Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.SignOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
                child: Text(
                  'LogOut',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
