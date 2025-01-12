import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      await Permission.location.request().then((value) {
        if (value.isGranted) {
          return true;
        }
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings().then((value) {
        return false;
      });
    }
    return false;
  }
}
