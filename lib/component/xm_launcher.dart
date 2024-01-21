import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class XMLauncher {
  final List<String> _marketUrls = [
    "vivomarket://details?id=your_package_name&th_name=need_comment",
    "oaps://mk/developer/comment?pkg=your_package_name",
    "appmarket://details?id=your_package_name",
    "mimarket://details?id=your_package_name",
    "itms-apps://itunes.apple.com/app/idyour_package_id?action=write-review",
  ];
  
  Future<bool> toMarketCN() async {
    final futures = Future.wait(_marketUrls.map((e) => canLaunchUrl(Uri.parse(e))));
    return futures.then((value) {
      String? url;
      for (int i = 0; i < value.length; i++) {
        if (value[i]) {
          url = _marketUrls[i];
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