class StudentValidationMixin {
  String? validateFirstName(String value) {
    if (value.length < 3) {
      return "İsim en az 3 karakter olmalıdır";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 2) {
      return "İsim en az 3 karakter olmalıdır";
    }
    return null;
  }

  String? validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalı";
    }

    return null;
  }
}
