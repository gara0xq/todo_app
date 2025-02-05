import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/controller/home_controller.dart';
import 'package:todo_app/todo_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  List<TodoModel> data = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  HomeController controller = HomeController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final responce = await http.get(Uri.parse("https://dummyjson.com/todos"));
    if (responce.statusCode == 200) {
      var sup = jsonDecode(responce.body);
      for (Map<String, dynamic> i in sup["todos"]) {
        widget.data.add(TodoModel.fromJson(i));
      }
      log(widget.data[0].runtimeType.toString());
      setState(() {
        // log(widget.data.toString());
      });
    }
  }

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Container(
                height: 250,
                color: Color(0xff4a3780),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "October 20, 2022",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "My Todo List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Form(
              //   key: keyForm,
              //   child: TextFormField(
              //     controller: emailController,
              //     onChanged: (value) {
              //       log(value.toString());
              //     },
              //     validator: (value) {
              //       if (value!.length > 16) {
              //         return "Too Long";
              //       }
              //       if (value!.length < 8) {
              //         return "too Short";
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: "Enter Email",
              //       labelText: "Email Address",
              //     ),
              //   ),
              // ),

              TextButton(
                onPressed: () {
                  controller.hasUser();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Check",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  log("message");
                  controller.login();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],  
          ),
        ),
      ),
    );
  }
}
