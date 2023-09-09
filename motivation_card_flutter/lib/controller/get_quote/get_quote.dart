import 'package:http/http.dart' as http;

Future<String> getMotivationalQuote() {
  http.get(Uri.parse('https:/localhost:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiiixxx')).then((response) {
      print("sa servera smo dobili ${response.body.toString()}");
        _quote = response.body.toString();
    }).catchError((err) {
      print('Server communication error: ${err.toString()}');
    })
        .timeout(Duration(seconds: 60), onTimeout: () {
      print(' HTTP request timeout');
    });
}