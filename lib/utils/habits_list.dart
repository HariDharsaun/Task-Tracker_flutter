import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)?deleteFunction;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 8,
        right: 8,
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion:const  StretchMotion(),
            children:[
              SlidableAction(
                  onPressed:deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade200,
                borderRadius: BorderRadius.circular(10),
              )
            ]),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.teal.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right:10,              ),
                child: Checkbox(
                    value: taskcompleted,
                    onChanged: onChanged,
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                  side: const BorderSide(
                    color: Colors.black,
                  )
                ),
              ),
              Text(
                taskname,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
