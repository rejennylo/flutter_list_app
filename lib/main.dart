import 'package:flutter/material.dart';

void main() {
  runApp(const MyListApp());
}

class MyListApp extends StatelessWidget {
  const MyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My List App",
      home: InputListPage(),
    );
  }
}

class InputListPage extends StatefulWidget {
  const InputListPage({super.key});

  @override
  State<InputListPage> createState() => _InputListPageState();
}

class _InputListPageState extends State<InputListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [];

  void _addItemToList() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _items.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My List App"),
          titleTextStyle: const TextStyle(fontSize: 21.0, color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      cursorColor: Colors.grey,
                      decoration: const InputDecoration(
                        labelText: "write something...",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _addItemToList,
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                    child: const Text("Submit"),

                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(_items[index]),
                        );
                      }
                  ))
            ],
          ),
        )
    );
  }
}