import 'package:basic_widget/student_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedstudents;
  StudentEdit(Student selectedstudents) {
    this.selectedstudents = selectedstudents;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentEdit(selectedstudents);
  }
}

class _StudentEdit extends State with StudentValidationMixin {
   late Student selectedstudents;
  _StudentEdit(Student selectedstudents) {
    this.selectedstudents =  selectedstudents;
  }
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni ögrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      initialValue: selectedstudents.firstName,
      decoration: InputDecoration(
        labelText: "Ögrenci adı",
        hintText: "Melih",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return validateFirstName(value);
      },
      onSaved: (String? value) {
        selectedstudents.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedstudents.lastName,
      decoration: InputDecoration(
        labelText: "Ögrenci soyadı",
        hintText: "Kahraman",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return validateLastName(value);
      },
      onSaved: (String? value) {
        selectedstudents.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedstudents.grade.toString(),
      decoration: InputDecoration(
        labelText: "Aldığı not",
        hintText: "85",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return validateGrade(value);
      },
      onSaved: (String? value) {
        selectedstudents.grade = int.parse(value!);
        selectedstudents.image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
      },
    );
  }

  buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedstudents.firstName);
    print(selectedstudents.lastName);
    print(selectedstudents.grade);
  }
}
