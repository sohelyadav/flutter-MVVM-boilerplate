import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/ui/todo/todo_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SimpleTodo();
  }
}
