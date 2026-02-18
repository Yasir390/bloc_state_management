import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_state_management/bloc_study/emails_get_api/model/emails_response_model.dart';
import 'package:http/http.dart' as http;

class EmailsRepository {
  Future<List<EmailsResponseModel>> fetchEmails() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"))
          .timeout(const Duration(seconds: 10)); // ✅ explicit timeout

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final List<dynamic> body = json.decode(response.body);
        return body
            .map(
              (e) => EmailsResponseModel(
                postId: e['postId'],
                id: e['id'],
                name: e['name'],
                body: e['body'],
                email: e['email'],
              ),
            )
            .toList();
      } else {
        throw HttpException(
          "Failed to fetch emails. Status code: ${response.statusCode}",
        );
      }
    } on SocketException {
      throw const SocketException("No Internet connection");
    } on TimeoutException {
      throw TimeoutException("Request timed out");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
