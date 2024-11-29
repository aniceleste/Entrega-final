import 'package:flutter/material.dart';
import '../models/auto.dart';

class AutoCard extends StatelessWidget {
  final Auto auto;
  final VoidCallback onDelete;

  AutoCard({required this.auto, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${auto.marca} ${auto.nombre}'),
        subtitle: Text('${auto.anio}'),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.deepPurple[400]),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
