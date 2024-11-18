import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/widgets/login_info.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height / 3 * 2 + 30 - 50,
      decoration: const BoxDecoration(
        color: kBackgroundColor,
      ),
      child: const LoginInfo(),
    );
  }
}
