class SingleTaskModel {
  SingleTaskModel({
    this.id,
    required this.nama,
    required this.title,
    required this.description,
    required this.kendala,
    required this.status,
  });

  final String? id;
  final String nama;
  final String title;
  final String description;
  final String kendala;
  final String status;

  factory SingleTaskModel.fromJson(Map<String, dynamic> json){ 
    return SingleTaskModel(
      id: json["id"] ?? "",
      nama: json["nama"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      kendala: json["kendala"] ?? "",
      status: json["status"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": id,
      "nama": nama,
      "title": title,
      "description": description,
      "kendala": kendala,
      "status": status,
    };

    // Menghapus semua pasangan key-value yang value-nya null
    data.removeWhere((key, value) => value == null);

    return data;
  }

}
