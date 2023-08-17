import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  PermissionType? _permissions;

  /// callback when permission is denied by user
  Function()? _onPermissionDenied;

  /// callback when permission is granted by user
  Function()? _onPermissionGranted;

  /// callback when permission is permanently denied by user
  Function()? _onPermissionPermanentlyDenied;

  PermissionHandler(PermissionType permissionType) {
    _permissions = permissionType;
  }

  PermissionHandler onPermissionDenied(Function()? onPermissionDenied) {
    _onPermissionDenied = onPermissionDenied;
    return this;
  }

  PermissionHandler onPermissionGranted(Function()? onPermissionGranted) {
    _onPermissionGranted = onPermissionGranted;
    return this;
  }

  PermissionHandler onPermissionPermanentlyDenied(
      Function()? onPermissionPermanentlyDenied) {
    _onPermissionPermanentlyDenied = onPermissionPermanentlyDenied;
    return this;
  }

  Permission _getPermissionFromType(PermissionType permissionType) {
    switch (permissionType) {
      case PermissionType.camera:
        return Permission.camera;
      case PermissionType.storage:
        return Permission.storage;
      case PermissionType.whenInUseLocation:
        return Permission.locationWhenInUse;
      case PermissionType.notification:
        return Permission.notification;
      default:
        throw Exception('Invalid permission type');
    }
  }

  void execute() async {
    Permission permission = _getPermissionFromType(_permissions!);

    if (permission == Permission.locationWhenInUse ||
        permission == Permission.locationAlways ||
        permission == Permission.location) {
      await permission.shouldShowRequestRationale;
    }
    PermissionStatus status = await permission.request();

    if (status.isGranted) {
      if (_onPermissionGranted != null) {
        _onPermissionGranted!();
      }
    } else if (status.isDenied) {
      if (_onPermissionDenied != null) {
        _onPermissionDenied!();
      }
    } else if (status.isPermanentlyDenied) {
      if (_onPermissionPermanentlyDenied != null) {
        _onPermissionPermanentlyDenied!();
      }
    }
  }
}

enum PermissionType {
  camera,
  storage,
  notification,
  location,
  whenInUseLocation,
}
