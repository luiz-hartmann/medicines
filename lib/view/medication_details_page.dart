import 'package:flutter/material.dart';
import 'package:medicines/model/medication.dart';
import 'package:medicines/view_model/medication_view_model.dart';
import 'add_medication_page.dart';
import 'package:provider/provider.dart';

class MedicationDetailsPage extends StatelessWidget {
  final Medication medication;
  MedicationDetailsPage({required this.medication});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Medication Details')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Name: ${medication.name}', style: TextStyle(fontSize: 18)),
              Text('Dosage: ${medication.dosage}',
                  style: TextStyle(fontSize: 18)),
              Text('Time: ${medication.time}', style: TextStyle(fontSize: 18)),
              Text('Frequency: ${medication.frequency}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMedicationPage()),
                      );
                    },
                    child: Text('Edit')),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<MedicationsViewModel>(context, listen: false)
                        .removeMedication(medication.id);
                    Navigator.pop(context);
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                )
              ])
            ])));
  }
}
