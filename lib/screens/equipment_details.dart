import 'package:flutter/material.dart';

import '../database/database_equipment.dart';
import '../models/equipment_model.dart';
import 'equipment_form.dart';

class EquipmentDetails extends StatefulWidget {
  final EquipmentModel equipment;

  const EquipmentDetails({
    super.key,
    required this.equipment,
  });

  @override
  State<EquipmentDetails> createState() => _EquipmentDetailsState();
}

class _EquipmentDetailsState extends State<EquipmentDetails> {
  final db = DatabaseEquipment();

  late EquipmentModel equipment;

  @override
  void initState() {
    super.initState();

    equipment = widget.equipment;
  }

  Future<void> editEquipment() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquipmentForm(
          equipment: equipment,
        ),
      ),
    );

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> deleteEquipment() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Equipment',
          ),
          content: Text(
            'Are you sure you want to delete '
            '"${equipment.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await db.deleteEquipment(
        equipment.id!,
      );

      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  Color getStatusColor() {
    if (equipment.status == 'Available') {
      return Colors.green;
    }

    if (equipment.status == 'Borrowed') {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Equipment Details',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: editEquipment,
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO SECTION
            _buildHero(),

            // INFORMATION
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildBasicInfo(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildStatusSection(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildLocationSection(),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildDeleteButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _buildHero() {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        children: [
          // BACKGROUND
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.indigo,
                  Color(0xff7986CB),
                ],
              ),
            ),
          ),

          // DECORATIVE CIRCLE
          Positioned(
            right: -40,
            top: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),

          // EQUIPMENT ICON
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.devices,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),

          // EQUIPMENT NAME
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: Column(
              children: [
                Text(
                  equipment.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  equipment.category,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BASIC INFORMATION
  // ============================================================

  Widget _buildBasicInfo() {
    return _infoCard(
      title: 'Basic Information',
      icon: Icons.info_outline,
      child: Column(
        children: [
          _infoRow(
            'Equipment ID',
            '#${equipment.id}',
            Icons.tag,
          ),
          _divider(),
          _infoRow(
            'Category',
            equipment.category,
            Icons.category_outlined,
          ),
          _divider(),
          _infoRow(
            'Condition',
            equipment.condition,
            Icons.health_and_safety_outlined,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS
  // ============================================================

  Widget _buildStatusSection() {
    final color = getStatusColor();

    return _infoCard(
      title: 'Current Status',
      icon: Icons.circle,
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            equipment.status,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LOCATION
  // ============================================================

  Widget _buildLocationSection() {
    return _infoCard(
      title: 'Location',
      icon: Icons.location_on_outlined,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              equipment.location,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INFO CARD
  // ============================================================

  Widget _infoCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.indigo,
                size: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          child,
        ],
      ),
    );
  }

  // ============================================================
  // INFO ROW
  // ============================================================

  Widget _infoRow(
    String title,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Divider(
        color: Colors.grey.shade200,
      ),
    );
  }

  // ============================================================
  // DELETE BUTTON
  // ============================================================

  Widget _buildDeleteButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: deleteEquipment,
        icon: const Icon(
          Icons.delete_outline,
        ),
        label: const Text(
          'Delete Equipment',
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
        ),
      ),
    );
  }
}
