import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_lite/db_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    // Fetch data from the database
    final dbData = await DBHandler().readData();
    setState(() {
      data = dbData; // Update the state with fetched data
    });

    // Print the data to the console
    print('Fetched Data:');
    print(dbData); // This will show the data in the console
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLITE Database"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await DBHandler().insertData(); // Insert data into DB
                _loadData(); // Reload the data after insertion
              },
              child: Text("Insert Data"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]['name'] ?? 'No Name'),
                    subtitle: Text('Age: ${data[index]['age'] ?? 'Unknown'}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
