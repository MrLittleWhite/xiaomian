import 'package:flutter/material.dart';
import 'package:xiaomian/assets_code/xm_icons.dart';
import 'package:xiaomian/component/xm_intl.dart';

enum XMErrorType {
  unknown,
  empty,
  networkNotAvailable,
  server,
}

class XMError {
  final XMErrorType type;
  const XMError(this.type);
  String get title {
    switch (type) {
      case XMErrorType.unknown:
        return XMIntl.current.unknownError;
      case XMErrorType.empty:
        return XMIntl.current.noDataError;
      case XMErrorType.networkNotAvailable:
        return XMIntl.current.connectError;
      case XMErrorType.server:
        return XMIntl.current.netError;
    }
  }

  String get message {
    switch (type) {
      case XMErrorType.unknown:
        return XMIntl.current.tryLater;
      case XMErrorType.empty:
        return XMIntl.current.noDataDesc;
      case XMErrorType.networkNotAvailable:
        return XMIntl.current.connectDesc;
      case XMErrorType.server:
        return XMIntl.current.netDesc;
    }
  }

  IconData get icon {
    switch (type) {
      case XMErrorType.unknown:
        return Icons.help_outline_rounded;
      case XMErrorType.empty:
        return XMIconfont.note;
      case XMErrorType.networkNotAvailable:
        return Icons.link_off;
      case XMErrorType.server:
        return Icons.cloud_off;
    }
  }

}