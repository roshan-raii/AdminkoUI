import 'dart:io';

import 'package:admin/logic/cubits/store_images/cubit/store_images_cubit.dart';
import 'package:admin/presentations/service/image_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatelessWidget {
  ImageHelper helper = new ImageHelper();

  MyImagePicker({Key? key}) : super(key: key);

  Future<void> _pickImage(BuildContext context) async {
    try {
      List<XFile> files = await helper.pickImage(multiple: false);
      if (files.length != 0) {
        await context.read<StoreImagesCubit>()
          ..addImage(File(files[0].path));
      } else {}
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 233, 214, 213),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            _pickImage(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Pick Image'),
          ),
        ),
      ],
    ));
  }
}
