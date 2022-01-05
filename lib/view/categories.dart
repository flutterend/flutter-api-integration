import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchCategory() async {
  final response = await http.get(
      Uri.parse('https://www.postman.com/collections/f192ee2ccc76afdddec5'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Categories');
  }
}

class Categories extends StatefulWidget {
  static const String route = "categories";
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<Map<String, dynamic>> futureCategory;
  @override
  void initState() {
    super.initState();
    futureCategory = fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON API'),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Map<String, dynamic>>(
            future: futureCategory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        child: const ListTile(
                          title: Text('DATA RECEIVED FROM JSON API.\n'
                              'I have created a categories model class for it as well check \n'
                              'lib/model/categories_model.dart.'),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green,
                        margin: const EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(17.0),
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 17),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('JSON API DATA'),
                            content: Text('$snapshot'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('Fetch Data From API'),
                      )
                    ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
