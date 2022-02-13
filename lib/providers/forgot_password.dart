import 'package:shelf/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: unused_element
_launchURL() async {
  const url = '$baseUrl/password_reset/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
