class EquipmentModel {
  int? id;
  String name;
  String category;
  String location;
  String status;
  String condition;
  String assignedTo;

  EquipmentModel({
    this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.status,
    required this.condition,
    required this.assignedTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'location': location,
      'status': status,
      'condition': condition,
      'assignedTo': assignedTo,
    };
  }

  factory EquipmentModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return EquipmentModel(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      location: map['location'],
      status: map['status'],
      condition: map['condition'],
      assignedTo: map['assignedTo'],
    );
  }
}
