import 'package:flutter/material.dart';

import '../database/database_equipment.dart';
import '../models/equipment_model.dart';

class EquipmentForm extends StatefulWidget {
  final EquipmentModel? equipment;

  const EquipmentForm({
    super.key,
    this.equipment,
  });

  @override
  State<EquipmentForm> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  final db = DatabaseEquipment();

  final nameController = TextEditingController();

  final locationController = TextEditingController();

  final assignedToController = TextEditingController();

  String category = 'Computing';
  String status = 'Available';
  String condition = 'Good';

  final categories = [
    'Computing',
    'Electronics',
    'Multimedia',
    'Networking',
    'Other',
  ];

  final statuses = [
    'Available',
    'Borrowed',
    'Maintenance',
  ];

  final conditions = [
    'New',
    'Good',
    'Needs Repair',
  ];

  bool get isEditing => widget.equipment != null;

  @override
  void initState() {
    super.initState();

    final item = widget.equipment;

    if (item != null) {
      nameController.text = item.name;
      locationController.text = item.location;
      assignedToController.text = item.assignedTo;

      category = item.category;
      status = item.status;
      condition = item.condition;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    assignedToController.dispose();

    super.dispose();
  }

  Future<void> saveEquipment() async {
    if (nameController.text.isEmpty || locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter name and location',
          ),
        ),
      );

      return;
    }

    final equipment = EquipmentModel(
      id: widget.equipment?.id,
      name: nameController.text,
      category: category,
      location: locationController.text,
      status: status,
      condition: condition,
      assignedTo: assignedToController.text,
    );

    if (isEditing) {
      await db.updateEquipment(
        equipment,
      );
    } else {
      await db.addEquipment(
        equipment,
      );
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Equipment' : 'Add Equipment',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Equipment Name',
              hintText: 'e.g. Dell Laptop',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.devices),
            ),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: category,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
            items: categories.map(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                category = value!;
              });
            },
          ),
          const SizedBox(height: 15),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Location',
              hintText: 'e.g. Software Lab',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: status,
            decoration: const InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(),
            ),
            items: statuses.map(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                status = value!;
              });
            },
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: condition,
            decoration: const InputDecoration(
              labelText: 'Condition',
              border: OutlineInputBorder(),
            ),
            items: conditions.map(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                condition = value!;
              });
            },
          ),
          const SizedBox(height: 15),
          TextField(
            controller: assignedToController,
            decoration: const InputDecoration(
              labelText: 'Assigned To',
              hintText: 'e.g. Laiba',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: saveEquipment,
              icon: Icon(
                isEditing ? Icons.save : Icons.add,
              ),
              label: Text(
                isEditing ? 'Update Equipment' : 'Add Equipment',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
