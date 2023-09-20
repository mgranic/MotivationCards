import 'package:http/http.dart';
import 'package:motivation_card_flutter/controller/util/web_service_communication_handler.dart';

class QuoteGenerator {
 /* Future<String> getMotivationalQuote() {
  http.get(Uri.parse('https:/localhost:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiiixxx')).then((response) {
      print("sa servera smo dobili ${response.body.toString()}");
        return response.body.toString();
    }).catchError((err) {
      print('Server communication error: ${err.toString()}');
    })
        .timeout(Duration(seconds: 60), onTimeout: () {
      print(' HTTP request timeout');
    });
  }*/

  Future<Response> _getMotivationalQuoteRequest() {
    return get(Uri.parse('https:/localhost:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiiixxx'));
  }
}