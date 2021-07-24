import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {

  final _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sehir Seç"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Sehir",
                    hintText: "Sehir Seçin",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){
              Navigator.pop(context, _textController.text);
            }, icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
