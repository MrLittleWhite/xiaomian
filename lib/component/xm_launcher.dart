import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class XMLauncher {
  Future<List<String>> get _marketUrls async {
    return PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      // //APP名称
      // String appName = packageInfo.appName;
      //包名
      String packageName = packageInfo.packageName;
      // //版本名
      // String  version = packageInfo.version;
      // //版本号
      // String buildNumber = packageInfo.buildNumber;

      return [
        // "vivomarket://details?id=your_package_name&th_name=need_comment",
        // "oaps://mk/developer/comment?pkg=your_package_name",
        // "appmarket://details?id=your_package_name",
        // "mimarket://details?id=your_package_name",
        // "itms-apps://itunes.apple.com/app/idyour_package_id?action=write-review",
        "market://details?id=$packageName",
      ];

    });
  } 
  
  Future<bool> toMarketCN() async {
    List<String> urls = [];

    return _marketUrls.then((value) {
        urls = value;
        return Future.wait(value.map((e) => canLaunchUrl(Uri.parse(e))));
      }).then((value) {
      String? url;
      for (int i = 0; i < value.length; i++) {
        if (value[i]) {
          url = urls[i];
          break;
        }
      }
      if (url != null) {
        launchUrlString(url);
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    });
  }
}