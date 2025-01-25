import 'package:flutter/material.dart';
import 'package:medicines/model/medication.dart';

class MedicationsViewModel extends ChangeNotifier {
  List<Medication> medicationsList = [];

  List<Medication> get medications => medicationsList;

  MedicationsViewModel() {
    medicationsList = [
      Medication(
          id: 1,
          name: 'Paracetamol',
          dosage: '500mg',
          time: '14:00',
          frequency: '2 times a day'),
      Medication(
          id: 2,
          name: 'Amoxicillin',
          dosage: '250mg',
          time: '08:00',
          frequency: '3 times a day'),
      Medication(
          id: 3,
          name: 'Ibuprofen',
          dosage: '400mg',
          time: '20:00',
          frequency: '1 time a day'),
      Medication(
          id: 4,
          name: 'Dipirona',
          dosage: '1000mg',
          time: '06:00',
          frequency: '4 times a day'),
      Medication(
          id: 5,
          name: 'Loratadina',
          dosage: '10mg',
          time: '10:00',
          frequency: '1 time a day'),
      Medication(
          id: 6,
          name: 'Aspirina',
          dosage: '100mg',
          time: '12:00',
          frequency: '2 times a day'),
      Medication(
          id: 7,
          name: 'Omeprazol',
          dosage: '20mg',
          time: '07:00',
          frequency: '1 time a day'),
      Medication(
          id: 8,
          name: 'Metformina',
          dosage: '850mg',
          time: '16:00',
          frequency: '2 times a day'),
      Medication(
          id: 9,
          name: 'Sinvastatina',
          dosage: '20mg',
          time: '22:00',
          frequency: '1 time a day'),
      Medication(
          id: 10,
          name: 'Losartana',
          dosage: '50mg',
          time: '09:00',
          frequency: '2 times a day'),
      Medication(
          id: 11,
          name: 'Clonazepam',
          dosage: '0.25mg',
          time: '23:00',
          frequency: '1 time a day'),
      Medication(
          id: 12,
          name: 'Vitamin C',
          dosage: '500mg',
          time: '11:00',
          frequency: '1 time a day'),
      Medication(
          id: 13,
          name: 'Vitamin D',
          dosage: '2000UI',
          time: '18:00',
          frequency: '1 time a day'),
      Medication(
          id: 14,
          name: 'Zinc',
          dosage: '30mg',
          time: '15:00',
          frequency: '1 time a day'),
      Medication(
          id: 15,
          name: 'Calcium',
          dosage: '600mg',
          time: '08:00',
          frequency: '1 time a day'),
    ];
  }

  void addMedication(Medication medication) {
    medicationsList.add(medication);
    notifyListeners();
  }

  void removeMedication(int id) {
    medicationsList.removeWhere((medication) => medication.id == id);
    notifyListeners();
  }
}
