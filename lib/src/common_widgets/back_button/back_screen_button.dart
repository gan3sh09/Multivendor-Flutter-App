import 'package:flutter/material.dart';
import '../../constants/size_config.dart';

class BackScreenButton extends StatelessWidget {
  const BackScreenButton({
    super.key,
    required this.icon,
    required this.press,
  });

  final Icon icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: IconButton(
        padding: EdgeInsets.zero,
        color: Colors.black,
        onPressed: press,
        // () => Get.back(),
        icon: icon,
        // Icon(LineAwesomeIcons.angle_left),
      ),
    );
  }
}
