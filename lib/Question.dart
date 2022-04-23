import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question(List this.groupQuestions, {Key? key}) : super(key: key);
  List groupQuestions;
  int i = 0;
  @override
  State<Question> createState() => _nameState();
}

class _nameState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [Icon(Icons.back_hand)]),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 91, 167, 156))),
                child: Text(
                  widget.groupQuestions[widget.i],
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () {
                  setState(() {
                    if (widget.i < widget.groupQuestions.length - 1)
                      widget.i = widget.i + 1;
                    else {
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
        ]));
  }
}
