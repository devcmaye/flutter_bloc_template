import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 1.2,
        ),
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 18,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                20, //   keyboard safe area
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min, //   Wrap content only
            children: [
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  "assets/images/home/cashout/success_image.png",
                  width: 55,
                  height: 55,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Success",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontFamily: AppFontFamily.googleSansFlex,
                  ),
                ),
              ),
              SizedBox(height: 50),

              CustomButton(
                text: AppStrings.button_close,
                onPressed: () async {
                  context.pop();
                },
              ),
              SizedBox(height: 30),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
