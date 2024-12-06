import 'dart:io';

import 'package:carrinton_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CaptureCamera extends ConsumerWidget {
  final String imageName;
  final AutoDisposeStateProvider<XFile?> imageProvider;

  const CaptureCamera({super.key, required this.imageName, required this.imageProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final capturedImage = ref.watch(imageProvider);

    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () async {
          // 네이티브 카메라 호출
          final ImagePicker _picker = ImagePicker();
          final XFile? picture = await _picker.pickImage(source: ImageSource.camera);

          if (picture != null) {
            ref.read(imageProvider.notifier).state = picture;
          }
        },
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: capturedImage == null
                        ? Container(color: lightGray,
                      child: Icon(Icons.camera_alt_outlined, size: 48, color: middleGray,),)
                        : Image.file(
                      File(capturedImage.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Text(
                imageName,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}