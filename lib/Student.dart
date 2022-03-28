import 'package:flutter/material.dart';

class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;
  late String image;

  Student.witoutInfo(){

  }

  Student.withId(int id ,String firstName, String lastName, int grade,String image) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._status = "";
    this.image = image;
  }
  Student(String firstName, String lastName, int grade,String image) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._status = "";
    this.image = image;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }



}
