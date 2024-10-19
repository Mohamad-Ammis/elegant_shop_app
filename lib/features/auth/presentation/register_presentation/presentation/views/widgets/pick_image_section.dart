import 'dart:io';

import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/image_picker_service.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/widgets/custom_camera_icon.dart';
import 'package:flutter/material.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  State<PickImageWidget> createState() => PickImageWidgetState();
}

class PickImageWidgetState extends State<PickImageWidget> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _imagePickerService.loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Stack(
              children: [
                CircleAvatar(radius: 80, child: CircularProgressIndicator()),
                CustomCameraIcon()
              ],
            ),
          );
        }

        String? imagePath = snapshot.data;
        return GestureDetector(
          onTap: () async {
            String? newImagePath =
                await _imagePickerService.pickImageFromGallery();
            if (newImagePath != null) {
              setState(() {});
            }
          },
          child: Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: (imagePath != null && imagePath.isNotEmpty)
                      ? FileImage(File(imagePath))
                      : const AssetImage(Assets.imagesPers),
                ),
                const CustomCameraIcon()
              ],
            ),
          ),
        );
      },
    );
  }
}
