// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sql_lite/db_handler.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _HomePageState();
//   }
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Map<String, dynamic>> data = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   void _loadData() async {
//     // Fetch data from the database
//     final dbData = await DBHandler().readData();
//     setState(() {
//       data = dbData; // Update the state with fetched data
//     });
//
//     // Print the data to the console
//     print('Fetched Data:');
//     print(dbData); // This will show the data in the console
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("SQLITE Database"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await DBHandler().insertData(); // Insert data into DB
//                 _loadData(); // Reload the data after insertion
//               },
//               child: Text("Insert Data"),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(data[index]['name'] ?? 'No Name'),
//                     subtitle: Text('Age: ${data[index]['age'] ?? 'Unknown'}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_lite/db_handler.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
  
}

class _HomePageState  extends State<HomePage>{
  DBHandlear dbHandlear = DBHandlear();
  List<Map<String, dynamic>> data = [];
  bool isDataVisible = false;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  void _loadData() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
   final selectdata = await dbHandlear.ReadData();
   setState(() {
     data = selectdata;
     isDataVisible = true;
     isLoading = false;
     print(selectdata);
   });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("DataBase SQLite"),),
     
     body: Column(
       children: [
         ElevatedButton(onPressed: (){
           _loadData();
         }, child: Text("Read Data")), 
         if(isLoading)
           Padding(padding: EdgeInsets.all(20.0),
             child: CircularProgressIndicator(),
           ),
         if(isDataVisible && !isLoading)
           Expanded(
               child: data.isEmpty

           ? Center(child: Text("No Data Fount"), )
                   : ListView.builder(
                   itemCount: data.length,
                   itemBuilder: (context, index){
                     return ListTile(
                       title: Text(data[index]['username']),
                       subtitle: Text(data[index]['email']),
                     );
               }) )
       ],
     ),
   );
  }
}
