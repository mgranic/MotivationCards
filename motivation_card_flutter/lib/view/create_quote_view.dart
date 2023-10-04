

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";
import 'package:motivation_card_flutter/controller/util/web_service_communication_handler.dart';


class CreateQuoteView extends StatefulWidget {
  @override
  State<CreateQuoteView> createState() => _CreateQuoteViewState();
}

class _CreateQuoteViewState extends State<CreateQuoteView> {

  final _quoteText = TextEditingController();
  final _quoteAuthor = TextEditingController();
  String? _selectedCategory;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ovo je naslov"),
        actions: [
          //IconButton(onPressed: onPressed, icon: icon)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter quote here',
              ),
              controller: _quoteText,
            ), 
            TextFormField(
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Author',
              ),
              controller: _quoteAuthor,
            ),
            Row(
                children: [
                  Text("Select category:"),
                  SizedBox(width: 10.0),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(child: Text("Motivation"), value: "motivation"),
                      DropdownMenuItem(child: Text("Consolt"), value: "consolt"),
                      DropdownMenuItem(child: Text("Uplift"), value: "uplift")
                    ], 
                    value: _selectedCategory,
                    onChanged:(val) {
                      setState(() {
                        _selectCategoryHandler(val as String?);
                      });
                    }
                  ),
              ],
            ), 
            Row(
              children: [
                Text("Select gender:"),
                SizedBox(width: 10.0),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("Other"), value: "other"),
                    DropdownMenuItem(child: Text("Male"), value: "male"),
                    DropdownMenuItem(child: Text("Female"), value: "female")
                  ], 
                  value: _selectedGender,
                  onChanged:(val) {
                    setState(() {
                      _selectGenderHandler(val as String?);
                    });
                  }
                ),
              ],
            ),
            
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: _saveQuoteHandler,
              child: Text('Save quote'),
            )
          ],
        ),
      ),
    );
  }

  void _selectCategoryHandler(String? category) {
    _selectedCategory = category;
    print(category!);
  }

  void _selectGenderHandler(String? gender) {
    _selectedGender = gender;
    print(gender!);
  }

  void _saveQuoteHandler() {
    print("******************************************************************************");
    print(_quoteText.text);
    print(_quoteAuthor.text);
    print(_selectedCategory);
    print(_selectedGender);
    print("******************************************************************************");
    ServiceCommunicationHandler webComm = ServiceCommunicationHandler();
    webComm.sendWebServiceRequest(_createMotivationalQuoteRequest, _createMotivationalQuoteResponseHandler);
    print("******************************************************************************");
  }

  Future<Response> _createMotivationalQuoteRequest() {
    return post(
      Uri.parse('http://localhost:5079/MotivationalQuoteApi/CreateMotivationalQuotePost'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String> {
        'quote': _quoteText.text,
        'author': _quoteAuthor.text,
        'gender': (_selectedGender ?? ""),
        'category': (_selectedCategory ?? ""),
      }),
    );  
  }

  void _createMotivationalQuoteResponseHandler(Response response) {
    print("sa servera smo dobili: ${response.body.toString()}");
  }
}