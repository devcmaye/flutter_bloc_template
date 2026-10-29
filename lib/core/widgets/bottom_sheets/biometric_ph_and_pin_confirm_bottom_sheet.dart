// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:payme_consumer/core/constants/common_constants.dart';
// import '../../utils/biometric_service.dart';
// import '../../../modules/auth/presentation/blocs/biometric/biometric_bloc.dart';
// import '../../constants/app_strings.dart';
// import '../../extensions/snackbar_extensions.dart';
// import '../../routes/app_routes.dart';
// import '../../routes/navigator_extenstions.dart';
// import '../common/custom_button.dart';
// import '../common/custom_text.dart';

// class BiometricPhAndPinConfirmBottomSheet extends StatelessWidget {
//   final BiometricOption selectedOption;

//   const BiometricPhAndPinConfirmBottomSheet({
//     required this.selectedOption,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BiometricBloc, BiometricState>(
//       listener: (context, state) {
//         if (state is BiometricConfirmFailure) {
//           context.showSnackBar(state.error, type: SnackBarType.error);
//         }

//         if (state is BiometricConfirmSuccess) {
//           Future.delayed(const Duration(milliseconds: 500), () {
//             context.showSnackBar(
//               'Authentication successful',
//               type: SnackBarType.success,
//             );
//             context.pushNamedAndRemoveAll(
//               AppRoutes.login,
//               arguments: {ArgumentConstant.isShowBack: false},
//             );
//           });
//         }
//       },
//       builder: (context, state) {
//         if (state is BiometricConfirmLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (state is BiometricConfirmLoaded) {
//           return _Content(state: state, selectedOption: selectedOption);
//         }

//         return const SizedBox();
//       },
//     );
//   }
// }

// class _Content extends StatelessWidget {
//   final BiometricConfirmLoaded state;
//   final BiometricOption selectedOption;

//   const _Content({required this.state, required this.selectedOption});

//   @override
//   Widget build(BuildContext context) {
//     final phoneController = TextEditingController(text: state.phone);
//     final pinController = TextEditingController(text: state.pin);

//     return Padding(
//       padding: EdgeInsets.only(
//         left: 18,
//         right: 18,
//         bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 35),

//           CustomText(
//             text: AppStrings.label_confirm_phone_and_pin,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),

//           const SizedBox(height: 30),

//           TextField(controller: phoneController),

//           const SizedBox(height: 20),

//           TextField(
//             controller: pinController,
//             obscureText: !state.isPinVisible,
//             maxLength: 6,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   state.isPinVisible ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   context.read<BiometricBloc>().add(TogglePinVisibilityEvent());
//                 },
//               ),
//             ),
//           ),

//           const SizedBox(height: 30),

//           CustomButton(
//             text: AppStrings.button_confirm,
//             onPressed: () {
//               context.read<BiometricBloc>().add(
//                 SubmitConfirmBiometricEvent(
//                   option: selectedOption,
//                   phone: phoneController.text,
//                   pin: pinController.text,
//                 ),
//               );
//             },
//           ),

//           const SizedBox(height: 50),
//         ],
//       ),
//     );
//   }
// }
