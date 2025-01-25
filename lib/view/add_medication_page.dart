import 'package:flutter/material.dart';
import 'package:medicines/model/medication.dart';
import 'package:medicines/view_model/medication_view_model.dart';
import 'package:provider/provider.dart';

class AddMedicationPage extends StatefulWidget {
  @override
  AddMedicationPageState createState() => AddMedicationPageState();
}

class AddMedicationPageState extends State<AddMedicationPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dosageController = TextEditingController();
  final timeController = TextEditingController();
  final frequencyController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    timeController.dispose();
    frequencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Medication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: dosageController,
                decoration: InputDecoration(labelText: 'Dosage'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert a dosage';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert a time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: frequencyController,
                decoration: InputDecoration(labelText: 'Frequency'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert the frequency';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final newMedication = Medication(
                        id: Provider.of<MedicationsViewModel>(context,
                                    listen: false)
                                .medications
                                .length +
                            1,
                        name: nameController.text,
                        dosage: dosageController.text,
                        time: timeController.text,
                        frequency: frequencyController.text);
                    Provider.of<MedicationsViewModel>(context, listen: false)
                        .addMedication(newMedication);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
