import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurancompetition/Question.dart';
import 'package:qurancompetition/provider.dart';
import 'package:qurancompetition/thems.dart';

class questionsgroup extends StatefulWidget {
  questionsgroup(int this.id, {Key? key}) : super(key: key);
  static final String questionsgroupName = 'ccc';
  int id;
  @override
  State<questionsgroup> createState() => _questionsgroupState();
}

class _questionsgroupState extends State<questionsgroup> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> groupQuestion =
        context.read<providerdata>().data.elementAt(widget.id);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: appbarcolor,
            actions: [Icon(Icons.back_hand)],
            title: Text(groupQuestion['title'] + ' -  مسابقة القرآن الكريم  ')),
        body: Container(
          color: Prinarycolor,
          child: GridView(
            padding: const EdgeInsets.all(25),
            children: groupQuestion['list']
                .map<Widget>(
                  (catData) => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: catData['slected']
                            ? MaterialStateProperty.all(
                                secondrycolor,
                              )
                            : MaterialStateProperty.all(
                                Prinarycolor,
                              ),
                      ),
                      child: Text(
                        (int.parse(catData['id2'])).toString(),
                        style: TextStyle(
                            color: catData['slected']
                                ? Prinarycolor
                                : secondrycolor,
                            fontSize: fontSizetext,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        List l = groupQuestion['list'] as List;
                        /* setState(() {
                          l.removeWhere(
                              (element) => element['id2'] == catData['id2']);
                        });*/

                        setState(() {
                          var index = groupQuestion['list'].indexOf(catData);
                          print(l.elementAt(index)['slected']);
                          l.elementAt(index)['slected'] = true;
                          print(l.elementAt(index)['slected']);
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
        ),

        //Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // child: Question(groupQuestion['list'] as List<dynamic>),
        // Text(groupQuestion['list'].toString()),
        // ]),
      ),
    );
  }
}
