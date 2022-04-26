import 'dart:ffi';

import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question(List this.groupQuestions, {Key? key}) : super(key: key);
  List groupQuestions;
  int i = 0;
  @override
  State<Question> createState() => _nameState();
}

class _nameState extends State<Question> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.groupQuestions[widget.i];
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("أسئلة البطاقة"),
            automaticallyImplyLeading: false,
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //color: Colors.amber,
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 50, top: 50, left: 20, right: 20),
              child: TextField(
                style: TextStyle(fontSize: 50.0, color: Colors.black),
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
                    labelStyle:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(),
                  child: Text(
                    'التالي',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.i < widget.groupQuestions.length - 1) {
                        widget.i = widget.i + 1;
                        _textEditingController.text =
                            widget.groupQuestions[widget.i];
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('سيدي الكريم'),
                            content: const Text('لقد انتهت جميع  الأسئلة  '),
                            actions: <Widget>[
                              /* TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('لا'),
                            ),*/
                              TextButton(
                                onPressed: () => {Navigator.pop(context, 'ok')},
                                child: const Text('نعم'),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  }),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                    style: ButtonStyle(),
                    child: Text(
                      'السابق',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        if (widget.i <= widget.groupQuestions.length - 1) {
                          widget.i = widget.i - 1;
                          _textEditingController.text =
                              widget.groupQuestions[widget.i];
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('سيدي  الكريم'),
                              content: const Text(
                                  'لقد انتهت  \n  \n  \nجميع  الأسئلة  '),
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
              ),
            ),
            widget.i >= widget.groupQuestions.length - 1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                : Text('')
          ])),
    );
  }
}
