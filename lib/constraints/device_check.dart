import 'dart:developer';

import 'package:flutter/cupertino.dart';

class DeviceCheck {
  bool isMobile({required BuildContext context}) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;

    if (devHeight / devWidth > 1) {
      log((devWidth / devHeight).toString());
      log('\nMobile \n');
      log(devHeight.toString());
      return true;
    } else {
      log('\nNot mobile \n');
      return false;
    }
  }

  bool isDesk({required BuildContext context}) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;

    if (devWidth / devHeight > 0.8) {
      log('\nDesk \n');
      log(devHeight.toString());
      log((devWidth / devHeight).toString());
      return true;
    } else {
      log('\nNot Desktop \n');
      return false;
    }
  }
}
