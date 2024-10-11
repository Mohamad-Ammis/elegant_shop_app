import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/auth/login/presentation/views/widgets/login_info.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.sizeOf(context).width,
      top: MediaQuery.sizeOf(context).height / 3 - 30 + 50,
      child: Container(
        height: MediaQuery.sizeOf(context).height / 3 * 2 + 30 - 50,
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))),
        child: const LoginInfo(),
      ),
    );
  }
}
