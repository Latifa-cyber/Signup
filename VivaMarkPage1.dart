import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VivaMarkPage1 extends StatefulWidget {
  const VivaMarkPage1({Key? key}) : super(key: key);
  @override
  State<VivaMarkPage1> createState() => _VivaMarkPage1State();
}

class _VivaMarkPage1State extends State<VivaMarkPage1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController projectName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController firstStudent = TextEditingController();
  TextEditingController secondStudent = TextEditingController();
  TextEditingController thirdStudent = TextEditingController();
  TextEditingController supervisorName = TextEditingController();
  TextEditingController supervisorMark = TextEditingController();
  TextEditingController presidentName = TextEditingController();
  TextEditingController presidentMark = TextEditingController();
  TextEditingController examinatorName = TextEditingController();
  TextEditingController examinatorMark = TextEditingController();

  FieldName(name) {
    return Container(
      margin: EdgeInsets.only(left: 40.0, top: 7.0),
      child: Text(
        name,
        style: TextStyle(
            color: Color(0xFF120D3A), fontFamily: 'MontaguSlab', fontSize: 12),
      ),
    );
  }

  FieldContent(hintText, controller, validators) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
      child: TextFormField(
        controller: controller,
        onSaved: (value) => {controller.text != value},
        validator: validators,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF120D3A), width: 22.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF120D3A), width: 2.0),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

  getStudentsData() async {
    FirebaseFirestore.instance
        .collection("students")
        .where('Full name', isEqualTo: firstStudent.text.toLowerCase())
        .get()
        .then((value) => value.docs.forEach((element) {
              if (element.data()['graduation year'] !=
                  double.parse(year.text.toString())) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        '${firstStudent.text} did not graduate on ${year.text}')));
              }
              if (element.data() == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'the name ${firstStudent.text} is not part of our Faculty')));
              }
            }));
    FirebaseFirestore.instance
        .collection("students")
        .where('Full name', isEqualTo: secondStudent.text.toLowerCase())
        .get()
        .then((value) => value.docs.forEach((element) {
              if (element.data()['graduation year'] != int.parse(year.text)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        '${element.data()['graduation year']} did not graduate on ${year.text}')));
              }
              if (element.data() == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'the name ${secondStudent.text} is not part of our Faculty')));
              }
            }));
    FirebaseFirestore.instance
        .collection("students")
        .where('Full name', isEqualTo: thirdStudent.text.toLowerCase())
        .get()
        .then((value) => value.docs.forEach((element) {
              if (element.data()['year'] != int.parse(year.text)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        '${thirdStudent.text} did not graduate on ${year.text}')));
              }
              if (element.data() == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'the name ${thirdStudent.text} is not part of our Faculty')));
              }
            }));
  }

  @override
  addProjectData() async {
    FirebaseFirestore.instance.collection("projects").add({
      "project name": "${projectName.text}",
      'year': int.parse(year.text),
      'students names': [
        "${firstStudent.text}",
        "${secondStudent.text}",
        "${thirdStudent.text}"
      ]
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xDDA663CC),
        toolbarHeight: 71,
        title: Text(
          'Viva Project',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'MontaguSlab',
              fontWeight: FontWeight.w200),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Form(
            key: formKey,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (BuildContext context, int n) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          'Fill in the following information:',
                          style: TextStyle(
                              color: Color(0xFF6F2DBD),
                              fontFamily: 'MontaguSlab',
                              fontSize: 14),
                        ),
                      ),
                      FieldName('Project Name:'),
                      FieldContent('Type a text..', projectName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName('Year:'),
                      FieldContent('ex: 2023', year, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if (double.parse(value!) > DateTime.now().year) {
                          return "you can't input dates that are in the future";
                        }
                        return null;
                      }),
                      FieldName('First Student Full Name:'),
                      FieldContent('Type a text..', firstStudent, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName('Second Student Full Name (optional):'),
                      FieldContent('Type a text..', secondStudent, null),
                      FieldName('Third Student Full Name (optional):'),
                      FieldContent('Type a text..', thirdStudent, null),
                      FieldName("Supervisor's Full Name: "),
                      FieldContent('Type a text..', supervisorName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName("Supervisor's Mark: "),
                      FieldContent('Type a number..', supervisorMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName(
                        "Viva President's Full Name: ",
                      ),
                      FieldContent('Type a text..', presidentMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName(
                        "Viva President's Mark: ",
                      ),
                      FieldContent('Type a number..', presidentMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName(
                        "Examinator's Full Name: ",
                      ),
                      FieldContent('Type a text..', examinatorName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName(
                        "Examinator's Mark: ",
                      ),
                      FieldContent('Type a number..', examinatorMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 30, top: 10, bottom: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                addProjectData();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFA663CC),
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: Color(0xFFA663CC))),
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 180,
                              child: Text(
                                'Calculate Viva',
                                style: TextStyle(
                                    fontFamily: 'MontaguSlab',
                                    fontSize: 21,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
