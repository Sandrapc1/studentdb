import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:hive_data_base/db/screens/search.dart';
import 'package:hive_data_base/db/screens/widgets/add_student.dart';
import 'package:hive_data_base/db/functions/db_functions.dart';
import 'package:hive_data_base/db/screens/widgets/list_student.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Student List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SearchScreen())));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: StudentList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          add(context);
        },
      ),
    );
  }

  add(BuildContext ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx1) => AddStudent_w()));
  }
}
