import 'package:flutter/material.dart';

class RegisterImageSection extends StatelessWidget {
  const RegisterImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 3,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/2215.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
