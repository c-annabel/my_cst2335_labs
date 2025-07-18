import 'package:flutter/material.dart';
import 'entity/todo.dart';
import 'database/tododatabase.dart';

class DetailsPage extends StatelessWidget {
  final ToDo item;
  final Function onDelete;
  final Function onClose;

  const DetailsPage({super.key, required this.item, required this.onDelete, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Name: ${item.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Quantity: ${item.quantity}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("ID: ${item.id}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => onDelete(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Delete"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => onClose(),
                  child: Text("Close"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
