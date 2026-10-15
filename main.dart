import '../../W2/Practice/1 - START CODE/EX-1.dart';

class Patient {
  final String _patientId;
  final String _name;
  final int _age;
  final bool _isUrgent;

  static int id = 0;
  Patient._({required String pName, required int pAge})
    : _patientId = "P${id++}",
      _isUrgent = false,
      _name = pName,
      _age = pAge;
  Patient.isUrgent({required String pName,required int pAge })
    : _patientId = "P${id}",
      _isUrgent = true,
      _name = pName,
      _age = pAge;



  @override
  String toString() =>
      "Name: $_name";
}



class Hospital {
  final String _name;
  final Address _location;
  List<Patient> _patientList;

  Hospital({required String hospitalName, required Address hospitalLocation})
    : _name = hospitalName,
      _location = hospitalLocation,
      _patientList = [];


  Patient addPatient(Patient newPatient) {
    _patientList.add(newPatient);
    return newPatient;
  }

  List<Patient> getUrgentPatients() {
    List<Patient> urgentPatient = _patientList
        .where((p) => p._isUrgent)
        .toList();
    return urgentPatient;
  }

  List<Patient> getUrgentPatientsFrom60() {
    List<Patient> urgentPatient = _patientList
        .where((p) => p._isUrgent && p._age >= 60)
        .toList();
    return urgentPatient;
  }
}

void main() {
  Hospital StarWar_Hospital = Hospital(
    hospitalName: "starWar",
    hospitalLocation: Address("St_10", "Basterium", "FAKE12345"),
  );
  Patient dara  = Patient.isUrgent(pName: "Dara",  pAge: 70);
  Patient sophea = Patient._(pName: "Sophea", pAge: 8);
  Patient malis = Patient.isUrgent(pName: "Malis", pAge: 55);
  Patient rith  = Patient._(pName: "Rith",   pAge: 65);

  StarWar_Hospital.addPatient(dara);
  StarWar_Hospital.addPatient(sophea);
  StarWar_Hospital.addPatient(malis);
  StarWar_Hospital.addPatient(rith);
 print(StarWar_Hospital.getUrgentPatients());
 print(StarWar_Hospital.getUrgentPatientsFrom60());
}
