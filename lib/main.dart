import 'package:basic_widget/Student.dart';
import 'package:basic_widget/StudentAdd.dart';
import 'package:basic_widget/StudentEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
    Student.withId(1,"Melih", "Kahraman", 80,
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
    Student.withId(2,"Mehmet Can", "Kahraman", 45,
        "https://listelist.com/wp-content/uploads/2019/02/her-tiklamada.jpg"),
    Student.withId(3,"Burak", "Yazıcıoglu", 35,
        "https://galeri13.uludagsozluk.com/697/en-guzel-gulen-insan_1197113.png"),
    Student.withId(4,"Ömer", "Altuntaş", 25,
        "https://www.arnavutkoy.bel.tr/uploads/birimler/e99fe.png")
  ];
  String emptyPng = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.pn";
  Student selectedStudent = Student.withId(1,"", "", 0, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ögrenci Takip Sistemi"),
        ),
        body: buildBody(context));
  }


  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(message),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili ögrenci : " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5,),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent)));

                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.yellow,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5,),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var message = "Silindi : " + selectedStudent.firstName;
                  showMessage(context, message);
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  buildStatusIcon(grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
