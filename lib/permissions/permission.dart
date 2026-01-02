import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  // Request camera permission
  var cameraStatus = await Permission.camera.request();

  // Request media permissions
  var storageStatus = await Permission.photos.request();

  // Check if all permissions are granted
  if (cameraStatus.isGranted && storageStatus.isGranted) {
    print("Permissions granted!");
    // You can now access the camera and media
  } else {
    print("Permissions denied!");
    // Handle the case where permissions are denied
  }
}
