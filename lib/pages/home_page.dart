import 'Package:flutter/material.dart';
import 'package:habittracker/utils/habits_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List habit_list = [
  ['Wake up at 5am',false],
  ['make sweat for 1 hour',false]
];

class _HomePageState extends State<HomePage> {
  final _controller = new TextEditingController();

  void checkBoxChanged(int index)
  {
    setState((){
      habit_list[index][1] = !habit_list[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      habit_list.add([_controller.text,false]);
      _controller.clear();
    });
  }

  void deleteTask(int index)
  {
    setState(() {
      habit_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        title: const Text('Task-Tracker📋',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: habit_list.length,
          itemBuilder: (BuildContext context,int index){
            return HabitsList(
              taskname: habit_list[index][0],
              taskcompleted: habit_list[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context)=> deleteTask(index),
            );
          },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child:  Padding(
              padding:const  EdgeInsets.only(
                right: 15,
                left: 28,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Type here......',
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:const BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
              onPressed:saveNewTask,
              child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
