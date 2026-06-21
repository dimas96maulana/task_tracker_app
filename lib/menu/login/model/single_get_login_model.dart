class SingleGetLoginModel {
  SingleGetLoginModel({
    required this.baseUrl,
    required this.idUserGroup,
    required this.username,
    required this.kodeUsername,
    required this.informasiPribadi,
    required this.informasiPerusahaan,
  });

  final String baseUrl;
  final int idUserGroup;
  final String username;
  final String kodeUsername;
  final InformasiPribadi? informasiPribadi;
  final InformasiPerusahaan? informasiPerusahaan;

  factory SingleGetLoginModel.fromJson(Map<String, dynamic> json){ 
    return SingleGetLoginModel(
      baseUrl: json["base_url"] ?? "",
      idUserGroup: json["id_user_group"] ?? 0,
      username: json["username"] ?? "",
      kodeUsername: json["kode_username"] ?? "",
      informasiPribadi: json["informasi_pribadi"] == null ? null : InformasiPribadi.fromJson(json["informasi_pribadi"]),
      informasiPerusahaan: json["informasi_perusahaan"] == null ? null : InformasiPerusahaan.fromJson(json["informasi_perusahaan"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "id_user_group": idUserGroup,
    "username": username,
    "kode_username": kodeUsername,
    "informasi_pribadi": informasiPribadi?.toJson(),
    "informasi_perusahaan": informasiPerusahaan?.toJson(),
  };

}

class InformasiPerusahaan {
  InformasiPerusahaan({
    required this.jabatan,
    required this.golongan,
    required this.tanggalMasuk,
  });

  final String jabatan;
  final String golongan;
  final String tanggalMasuk;

  factory InformasiPerusahaan.fromJson(Map<String, dynamic> json){ 
    return InformasiPerusahaan(
      jabatan: json["jabatan"] ?? "",
      golongan: json["golongan"] ?? "",
      tanggalMasuk: json["tanggal_masuk"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "jabatan": jabatan,
    "golongan": golongan,
    "tanggal_masuk": tanggalMasuk,
  };

}

class InformasiPribadi {
  InformasiPribadi({
    required this.nama,
    required this.alamat,
    required this.nomer,
    required this.status,
    required this.umur,
    required this.golonganDarah,
  });

  final String nama;
  final String alamat;
  final String nomer;
  final String status;
  final num umur;
  final String golonganDarah;

  factory InformasiPribadi.fromJson(Map<String, dynamic> json){ 
    return InformasiPribadi(
      nama: json["nama"] ?? "",
      alamat: json["alamat"] ?? "",
      nomer: json["nomer"] ?? "",
      status: json["status"] ?? "",
      umur: json["umur"] ?? 0,
      golonganDarah: json["golongan_darah"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "alamat": alamat,
    "nomer": nomer,
    "status": status,
    "umur": umur,
    "golongan_darah": golonganDarah,
  };

}
