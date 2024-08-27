// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert'; // Required for jsonEncode

import 'package:http/http.dart' as http;

class sendEmailService {
  static Future<void> sendMail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      var endPointUrl =
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      // Create the data map for JSON encoding
      var data = {
        'service_id': 'service_hzcex0z',
        'template_id': 'template_03ruuti',
        'user_id': '-Y_yJ7N5jNZ0RZ1DM',
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      };

      // Send the POST request with JSON-encoded body
      var response = await http.post(
        endPointUrl,
        headers: {
          'Content-Type':
              'application/json', // Ensure the header is set to application/json
        },
        body: jsonEncode(data), // Encode the data map to a JSON string
      );

      if (response.statusCode == 200) {
        print('Email sent successfully: ${response.body}');
      } else {
        print('Failed to send email: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
