import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurancompetition/Question.dart';
import 'package:qurancompetition/provider.dart';

class questionsgroup extends StatefulWidget {
  questionsgroup(String this.id, {Key? key}) : super(key: key);
  static final String questionsgroupName = 'ccc';
  String id;
  @override
  State<questionsgroup> createState() => _questionsgroupState();
}

class _questionsgroupState extends State<questionsgroup> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> groupQuestion =
        context.read<providerdata>().data.elementAt(int.parse(widget.id));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            actions: [Icon(Icons.back_hand)],
            title: Text(groupQuestion['title'])),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: groupQuestion['list']
              .map<Widget>(
                (catData) => ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 91, 167, 156))),
                    child: Text(
                      (int.parse(catData['id2']) + 1).toString(),
                    ),
                    onPressed: () {
                      List l = groupQuestion['list'] as List;
                      setState(() {
                        l.removeWhere(
                            (element) => element['id2'] == catData['id2']);
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Question(catData['answers'] as List<String>)),
                      );
                    }),
              )
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
          ),
        ),

        //Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // child: Question(groupQuestion['list'] as List<dynamic>),
        // Text(groupQuestion['list'].toString()),
        // ]),
      ),
    );
  }
}
