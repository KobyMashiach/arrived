import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

sendMessageInWhatsapp(String phoneNumber, String text) async {
  final link = WhatsAppUnilink(
    phoneNumber: phoneNumber,
    text: text,
  );
  await launchUrl(link.asUri(), mode: LaunchMode.externalApplication);
}
