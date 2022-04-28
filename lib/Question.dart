import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qurancompetition/thems.dart';

class Question extends StatefulWidget {
  Question(List this.groupQuestions, {Key? key}) : super(key: key);
  List groupQuestions;
  int i = 0;
  @override
  State<Question> createState() => _nameState();
}

class _nameState extends State<Question> {
  final TextEditingController _textEditingController = TextEditingController();
  String s = 'jjj';
  String part1 = '';
  int menndex = 0;
  String surename = '';
  String ila = '';
  String ayestart = '';
  int ilaindex = 0;
  String ayesend = '';
  String tasmiaText = '';
  @override
  void initState() {
    super.initState();
    SetCard();
  }

  void SetCard() {
    String s = widget.groupQuestions[widget.i];
    menndex = s.indexOf('-    من    ');
    part1 = s.substring(0, menndex + 7);
    surename = s.substring(0, s.indexOf('-    من    '));
    ila = '……………………………………...   إلى     ';
    ilaindex = s.indexOf(ila);
    ayestart = s.substring(part1.length, ilaindex);
    ayesend = s.substring(ilaindex + ila.length);
    tasmiaText = ayestart + '  .........  ' + ayesend;

    _textEditingController.text = tasmiaText;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SetCard();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("أسئلة البطاقة   - مسابقة القرآن الكريم"),
            backgroundColor: appbarcolor,
            automaticallyImplyLeading: false,
          ),
          body: Container(
            color: secondrycolor,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, top: 50, left: 20, right: 20),
                child: Text(
                  surename,
                  style: TextStyle(
                      color: Color.fromARGB(255, 214, 8, 8),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //color: Colors.amber,
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 50, top: 10, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(fontSize: 35.0, color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  controller: _textEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: (widget.i + 1).toString(),
                      labelStyle: TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Prinarycolor,
                        ),
                      ),
                      child: Text(
                        'التالي',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.i < widget.groupQuestions.length - 1) {
                            widget.i = widget.i + 1;
                            _textEditingController.text = tasmiaText;
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('سيدي الكريم'),
                                content:
                                    const Text('لقد انتهت جميع  الأسئلة  '),
                                actions: <Widget>[
                                  /* TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('لا'),
                                  ),*/
                                  TextButton(
                                    onPressed: () =>
                                        {Navigator.pop(context, 'ok')},
                                    child: const Text('نعم'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      }),
                  SizedBox(
                    width: 150,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Prinarycolor,
                        ),
                      ),
                      child: Text(
                        'السابق',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.i != 0) {
                            widget.i = widget.i - 1;
                            _textEditingController.text = tasmiaText;
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('سيدي  الكريم'),
                                content: const Text(
                                    '  تم الرجوع  إلى السؤال الأول '),
                                actions: <Widget>[
                                  /* TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('لا'),
                                ),*/
                                  TextButton(
                                    onPressed: () =>
                                        {Navigator.pop(context, 'ok')},
                                    child: const Text('نعم'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              widget.i >= widget.groupQuestions.length - 1
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Prinarycolor,
                            ),
                          ),
                          child: Text(
                            'الرجوع  الى  بطاقة جديدة',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    )
                  : Text(''),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Prinarycolor,
                    ),
                  ),
                  child: Text(
                    'تنبيه',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 207, 19, 5),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: secondrycolor,
                        title: Center(
                            child: const Text(' أخي الكريم',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 207, 19, 5),
                                    fontWeight: FontWeight.bold))),
                        content: Container(
                          color: secondrycolor,
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.warning_amber,
                                  color: Color.fromARGB(255, 231, 2, 2),
                                  size: 50.0,
                                ),
                              ),
                              Center(
                                child: const Text(
                                  ' نرجو منك الإنتباه ! .    ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 207, 19, 5),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          /* TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('لا'),
                                ),*/
                          ElevatedButton(
                            onPressed: () => {Navigator.pop(context, 'ok')},
                            child: Center(child: const Text('نعم')),
                          ),
                        ],
                      ),
                    );
                  }),
            ]),
          )),
    );
  }
}
