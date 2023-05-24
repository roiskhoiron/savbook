import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

checkPermission(Permission permission) async {
  var status = await permission.status;
  Get.log('stauts permssion $status');
  if (status == PermissionStatus.granted) {
    return true;
  }

  return false;
}

askMultiplePermission(List<Permission> listPermission) async {
  await listPermission.request();
}

// class enumPermission
