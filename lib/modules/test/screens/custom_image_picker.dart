import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();

  static void showBottomSheet(
      {required BuildContext context, ValueChanged<File>? onSelected}) {
    ImagePicker imagePicker = ImagePicker();

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Load Photo'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              await imagePicker
                  .pickImage(source: ImageSource.camera)
                  .then((value) {
                if (onSelected != null && value != null) {
                  onSelected(File(value.path));
                }
              });
            },
            child: const Text('Take Photo'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await imagePicker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (onSelected != null && value != null) {
                  onSelected(File(value.path));
                }
              });
            },
            child: const Text('Choose form Library'),
          ),
        ],
      ),
    );
  }
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();

  File? _file;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showBottomSheet(context);
        // _imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
        // _file = File(_imageFile!.path);
        // setState(() {});
      },
      child: isLoading
          ? _loadingWidget()
          : Container(
              margin: const EdgeInsets.all(30),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: _file != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(_file!),
                      )
                    : null,
              ),
            ),
    );
  }

  void showBottomSheet(context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Load Photo'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {},
            child: const Text('Take Photo'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              _getImage();
            },
            child: const Text('Choose form Library'),
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    setState(() {});
    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          _file = File(value.path);
        });
      } else {
        setState(() {});
        debugPrint('Somethings error try select other image.');
      }
    });
  }

  Widget _loadingWidget() => Container(
        margin: const EdgeInsets.all(30),
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const CupertinoActivityIndicator(),
      );
}
