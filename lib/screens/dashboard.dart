import 'package:flutter/material.dart';

import '../database/database_equipment.dart';
import '../models/equipment_model.dart';
import 'equipment_form.dart';
import 'equipment_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final db = DatabaseEquipment();

  final searchController = TextEditingController();

  String searchText = '';

  String selectedCategory = 'All';

  String selectedStatus = 'All';

  final categories = [
    'All',
    'Computing',
    'Electronics',
    'Multimedia',
    'Networking',
    'Other',
  ];

  final statuses = [
    'All',
    'Available',
    'Borrowed',
    'Maintenance',
  ];

  void refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> deleteEquipment(
    EquipmentModel equipment,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Equipment',
          ),
          content: Text(
            'Delete "${equipment.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
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

      refresh();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          const SnackBar(
            content: Text(
              'Equipment deleted successfully',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text(
          'LabTrack',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<EquipmentModel>>(
        future: db.getAllEquipment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final allEquipment = snapshot.data ?? [];

          final equipment = _filterEquipment(
            allEquipment,
          );

          return ListView(
            padding: const EdgeInsets.all(
              16,
            ),
            children: [
              _buildHeader(),
              const SizedBox(
                height: 15,
              ),
              _buildSearchBar(),
              const SizedBox(
                height: 20,
              ),
              _buildStatistics(
                allEquipment,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildCategoryFilters(),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildStatusFilters(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lab Equipment',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${equipment.length} found',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              if (equipment.isEmpty)
                _buildEmptyState()
              else
                ...equipment.map(
                  (item) => _buildEquipmentCard(
                    item,
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EquipmentForm(),
            ),
          );

          refresh();
        },
        icon: const Icon(
          Icons.add,
        ),
        label: const Text(
          'Add Equipment',
        ),
      ),
    );
  }

  // ============================================================
  // FILTER
  // ============================================================

  List<EquipmentModel> _filterEquipment(
    List<EquipmentModel> allEquipment,
  ) {
    return allEquipment.where(
      (item) {
        final matchesSearch = item.name.toLowerCase().contains(
                  searchText,
                ) ||
            item.category.toLowerCase().contains(
                  searchText,
                ) ||
            item.location.toLowerCase().contains(
                  searchText,
                );

        final matchesCategory =
            selectedCategory == 'All' || item.category == selectedCategory;

        final matchesStatus =
            selectedStatus == 'All' || item.status == selectedStatus;

        return matchesSearch && matchesCategory && matchesStatus;
      },
    ).toList();
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.indigo,
            Color(0xff5C6BC0),
          ],
        ),
        borderRadius: BorderRadius.circular(
          22,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white24,
            child: const Icon(
              Icons.science,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Text(
                  'LabTrack',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
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
  // SEARCH
  // ============================================================

  Widget _buildSearchBar() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          searchText = value.toLowerCase();
        });
      },
      decoration: InputDecoration(
        hintText: 'Search equipment...',
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: searchText.isNotEmpty
            ? IconButton(
                onPressed: () {
                  searchController.clear();

                  setState(() {
                    searchText = '';
                  });
                },
                icon: const Icon(
                  Icons.clear,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORY
  // ============================================================

  Widget _buildCategoryFilters() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map(
        (category) {
          return ChoiceChip(
            label: Text(category),
            selected: selectedCategory == category,
            onSelected: (_) {
              setState(() {
                selectedCategory = category;
              });
            },
          );
        },
      ).toList(),
    );
  }

  // ============================================================
  // STATUS
  // ============================================================

  Widget _buildStatusFilters() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: statuses.map(
        (status) {
          return ChoiceChip(
            label: Text(status),
            selected: selectedStatus == status,
            onSelected: (_) {
              setState(() {
                selectedStatus = status;
              });
            },
          );
        },
      ).toList(),
    );
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  Widget _buildStatistics(
    List<EquipmentModel> equipment,
  ) {
    final total = equipment.length;

    final available = equipment
        .where(
          (item) => item.status == 'Available',
        )
        .length;

    final borrowed = equipment
        .where(
          (item) => item.status == 'Borrowed',
        )
        .length;

    final maintenance = equipment
        .where(
          (item) => item.status == 'Maintenance',
        )
        .length;

    return Row(
      children: [
        Expanded(
          child: _statCard(
            'Total',
            total,
            Icons.inventory_2,
            Colors.indigo,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _statCard(
            'Available',
            available,
            Icons.check_circle,
            Colors.green,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _statCard(
            'Borrowed',
            borrowed,
            Icons.person,
            Colors.orange,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _statCard(
            'Repair',
            maintenance,
            Icons.build,
            Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _statCard(
    String title,
    int number,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EQUIPMENT CARD
  // ============================================================

  Widget _buildEquipmentCard(
    EquipmentModel item,
  ) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          18,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          18,
        ),
        onTap: () async {
          final updated = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EquipmentDetails(
                equipment: item,
              ),
            ),
          );

          if (updated == true) {
            refresh();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(
            14,
          ),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(
                    0.10,
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: const Icon(
                  Icons.devices,
                  color: Colors.indigo,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${item.category} • '
                      '${item.location}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 6,
                      children: [
                        _badge(
                          item.status,
                        ),
                        _badge(
                          item.condition,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(
          0.08,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY
  // ============================================================

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(
        40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'No Equipment Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Try changing your search '
            'or filters.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
