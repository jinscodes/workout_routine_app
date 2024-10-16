import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:workout_app/colors.dart';

final defaultPinTheme = PinTheme(
  width: 55.w,
  height: 55.h,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: ColorsTheme.gray400,
        width: 3,
      ),
    ),
  ),
  textStyle: TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: ColorsTheme.gray600,
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: const Border(
    bottom: BorderSide(
      color: ColorsTheme.point,
      width: 3,
    ),
  ),
);

class PinInput extends StatelessWidget {
  final TextEditingController emailValidController;

  const PinInput({
    super.key,
    required this.emailValidController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 60.h,
      ),
      child: Pinput(
        controller: emailValidController,
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        // onCompleted: (pin) => print(pin),
      ),
    );
  }
}
