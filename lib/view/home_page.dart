import 'package:flutter/material.dart';
import 'package:medicines/view_model/medication_view_model.dart';
import 'package:medicines/view/add_medication_page.dart';
import 'package:medicines/view/medication_details_page.dart';
import 'package:medicines/model/medication.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MedicationApp')),
      body: Consumer<MedicationsViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.medications.length,
            itemBuilder: (context, index) {
              final medication = viewModel.medications[index];
              return ListTile(
                leading: Icon(Icons.medication, size: 40, color: Colors.blue),
                title: Text(medication.name),
                subtitle: Text('${medication.frequency}'),
                onLongPress: () {
                  showDeleteConfirmationDialog(context, medication);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicationDetailsPage(medication: medication)
                    )
                  );
                }
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicationPage())
          );
        },
      ),
    );
  }
 
    void showDeleteConfirmationDialog(BuildContext context, Medication medication) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Delete Medication?'),
                content: Text('Are you sure you want to delete ${medication.name}?'),
                actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                    ),
                    TextButton(
                        onPressed: () {
                            Provider.of<MedicationsViewModel>(context, listen: false).removeMedication(medication.id);
                            Navigator.of(context).pop();
                        },
                        child: Text('Delete'),
                    )
                ],
            );
        });
    }
}