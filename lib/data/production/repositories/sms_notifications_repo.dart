import 'package:twilio_flutter/twilio_flutter.dart';

class SmsNotificationRepository {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid:
          'ACda99bf5d3ce5c94ebaa441ccf6930bf4', // replace *** with Account SID
      authToken:
          '47cc075d72ad881e40fe3b79ec80a276', // replace xxx with Auth Token
      twilioNumber: '+14155238886' // replace .... with Twilio Number
      );

  void sendWhatsappNotification(String message, String numberPhone) {
    twilioFlutter.sendWhatsApp(
        toNumber: '+506$numberPhone',
        messageBody: 'Enviado desde flutter por steven \n $message');
  }
}
