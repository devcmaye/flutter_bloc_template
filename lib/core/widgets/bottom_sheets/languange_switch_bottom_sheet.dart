import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../modules/base_module/presentation/blocs/language/local_language_bloc.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../constants/svg_constants.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_text.dart';
import '../language_selector.dart';

class LanguangeSwitchBottomSheet extends StatelessWidget {
  const LanguangeSwitchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalLanguageBloc, LocalLanguageState>(
      listener: (context, state) {
        if (state is LanguageLoaded) {
          context.setLocale(state.locale);
        }
      },
      builder: (context, state) {
        final currentLocale = state is LanguageLoaded
            ? state.locale.languageCode
            : LanguageType.my.name;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.label_choose_language,
                fontSize: AppFontsSize.bodyNormal,
                fontWeight: AppFontWeight.semiBold,
              ),

              const SizedBox(height: 25),

              _languageOption(
                context,
                value: LanguageType.my.name,
                groupValue: currentLocale,
                flag: SvgConstants.icon_mm_flag,
                label: "မြန်မာ",
                onSelected: () {
                  context.read<LocalLanguageBloc>().add(
                    ChangeLanguageEvent(
                      Locale(LanguageType.my.name, LanguageValue.MM.name),
                    ),
                  );
                  context.pop();
                },
              ),

              const SizedBox(height: 10),

              _languageOption(
                context,
                value: LanguageType.en.name,
                groupValue: currentLocale,
                flag: SvgConstants.icon_us_flag,
                label: "English (United States)",
                onSelected: () {
                  context.read<LocalLanguageBloc>().add(
                    ChangeLanguageEvent(
                      Locale(LanguageType.en.name, LanguageValue.US.name),
                    ),
                  );
                  context.pop();
                },
              ),

              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}

Widget _languageOption(
  BuildContext context, {
  required String value,
  required String groupValue,
  required String flag,
  required String label,
  required VoidCallback onSelected,
}) {
  return InkWell(
    onTap: onSelected,
    child: Row(
      children: [
        Radio(
          activeColor: AppColor.deepPrimaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: (_) => onSelected(),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(flag, width: 20, height: 20),
        ),
        const SizedBox(width: 12),

        CustomText(
          text: label,
          fontSize: AppFontsSize.bodyNormal,
          fontWeight: AppFontWeight.medium,
        ),
      ],
    ),
  );
}
