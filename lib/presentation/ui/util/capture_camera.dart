import 'dart:io';

import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CaptureCamera extends ConsumerWidget {
  final String imageName;
  final XFile? image;
  final Function(XFile) onImagePicked;

  const CaptureCamera({
    super.key,
    required this.imageName,
    required this.image,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? picture = await picker.pickImage(source: ImageSource.camera);
          if (picture != null) {
            onImagePicked(picture);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: image == null
                      ? Container(
                    color: lightGray,
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 48,
                      color: middleGray,
                    ),
                  )
                      : Image.file(
                    File(image?.path ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              imageName,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
