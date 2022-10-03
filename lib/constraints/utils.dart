import 'dart:developer';
import 'dart:io';

import 'package:aceshop/constraints/constraints.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  snackbarKey.currentState?.showSnackBar(SnackBar(content: Text(text)));
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    } else {}
  } catch (e) {
    log(e.toString());
  }
  return images;
}
