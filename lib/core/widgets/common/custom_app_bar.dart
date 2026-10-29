import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app_config/app_color.dart';
import '../../routes/navigator_extenstions.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final Color? backgroudColor;
  final Color? textColor;
  final VoidCallback? onBack;
  final double height;
  final TextOverflow overflow;

  CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBackButton = true,
    this.backgroudColor = AppColor.whiteColor,
    this.textColor = AppColor.blackColor,
    this.overflow = TextOverflow.ellipsis,
    this.onBack,
    this.height = 95,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(color: backgroudColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //BackButton Orange
          if (showBackButton)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: onBack ?? () => context.pop(),
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.whiteColor,
                    size: 18,
                  ),
                ),
              ),
            ),

          // if (showBackButton)
          //   IconButton(
          //     icon: Icon(Icons.arrow_back_ios_new, color: textColor),
          //     onPressed: onBack ?? () => context.pop(),
          //   ),
          if (centerTitle)
            Expanded(
              child: Center(
                child: CustomText(
                  text: title,
                  fontSize: 17,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  textOverflow: overflow,
                ),
              ),
            )
          else
            CustomText(
              text: title,
              fontSize: 17,
              color: textColor,
              fontWeight: FontWeight.w600,
              textOverflow: overflow,
            ),

          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool centerTitle;
//   final bool showBackButton;
//   final Color? backgroudColor;
//   final Color? textColor;
//   final VoidCallback? onBack;
//   final double height;
//   final TextOverflow overflow;

//   CustomAppBar({
//     super.key,
//     required this.title,
//     this.centerTitle = true,
//     this.showBackButton = true,
//     this.backgroudColor = AppColor.whiteColor,
//     this.textColor = AppColor.blackColor,
//     this.overflow = TextOverflow.ellipsis,
//     this.onBack,
//     this.height = 90,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: backgroudColor, //SAME AS APP BAR
//         statusBarIconBrightness: backgroudColor == Colors.white
//             ? Brightness.dark
//             : Brightness.light,
//       ),
//       child: PreferredSize(
//         preferredSize: Size.fromHeight(height),
//         child: Container(
//           height: height,
//           padding: EdgeInsets.only(
//             top: MediaQuery.of(context).padding.top,
//             left: 16,
//             right: 16,
//           ),
//           decoration: BoxDecoration(color: backgroudColor),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               //BackButton Orange
//               if (showBackButton)
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: InkWell(
//                     onTap: onBack ?? () => context.pop(),
//                     child: Container(
//                       margin: EdgeInsets.only(left: 5),
//                       padding: EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: AppColor.primaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_new,
//                         color: AppColor.whiteColor,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),

//               // if (showBackButton)
//               //   IconButton(
//               //     icon: Icon(Icons.arrow_back_ios_new, color: textColor),
//               //     onPressed: onBack ?? () => context.pop(),
//               //   ),
//               if (centerTitle)
//                 Expanded(
//                   child: Center(
//                     child: CustomText(
//                       text: title,
//                       fontSize: 17,
//                       color: textColor,
//                       fontWeight: FontWeight.w600,
//                       textOverflow: overflow,
//                     ),
//                   ),
//                 )
//               else
//                 CustomText(
//                   text: title,
//                   fontSize: 17,
//                   color: textColor,
//                   fontWeight: FontWeight.w600,
//                   textOverflow: overflow,
//                 ),

//               SizedBox(width: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
