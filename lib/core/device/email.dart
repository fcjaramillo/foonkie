import 'package:url_launcher/url_launcher.dart';

class Email {
  Future sendEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      query: encodeQueryParameters(
        <String, String>{
          'subject': 'I want a quote',
          'body': 'I need you to build an application',
        },
      ),
    );

    await launchUrl(emailLaunchUri);
  }
}