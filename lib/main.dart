import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'classes/Datas.dart';

void main() {
  runApp(HomeView());
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[900],
          body: SafeArea(child: QuestionView())),
    );
  }
}

class QuestionView extends StatefulWidget {
  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Widget> iconList = [];
  int questionIndex = 0;
  Datas datas = new Datas();

  bool isFinished = false;

  void checkQuestionAnswer(bool answer) {
    setState(() {
      if (questionIndex != datas.questions.length - 1) {
        print(questionIndex);
        if (datas.questions[questionIndex].soruCevap == answer) {
          iconList.add(trueIcon);
          questionIndex++;
        } else {
          iconList.add(falseIcon);
          questionIndex++;
        }
      } else if (datas.questions[questionIndex].soruCevap == answer &&
          !(isFinished)) {
        iconList.add(trueIcon);
        isFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              (questionIndex + 1).toString() +
                  ". " +
                  datas.questions[questionIndex].soruMetin,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Wrap(
            children: iconList,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                    ),
                    onPressed: () {
                      checkQuestionAnswer(false);
                    },
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                    ),
                    onPressed: () {
                      checkQuestionAnswer(true);
                    },
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
