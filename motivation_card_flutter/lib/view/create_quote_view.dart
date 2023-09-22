

import 'package:flutter/material.dart';


class CreateQuoteView extends StatefulWidget {
  @override
  State<CreateQuoteView> createState() => _CreateQuoteViewState();
}

class _CreateQuoteViewState extends State<CreateQuoteView>{
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
            // https://docs.flutter.dev/cookbook/forms/validation?gclid=Cj0KCQjw9rSoBhCiARIsAFOiplm-mn4uC-UYWuoN3Hk6FgZKgEWXE4fyrud_hl_yHpQyGQrUqPGkbosaAphmEALw_wcB&gclsrc=aw.ds
            const Text(
              'Ovo je neki tekst samo da potvrdimo da radi',
            ),
          ],
        ),
      ),
    );
  }

}