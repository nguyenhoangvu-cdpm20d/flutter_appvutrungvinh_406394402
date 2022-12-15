class LSObject {
  final String uid;
  final String name;
  final String tenchude;
  final String chedo;
  final int diem;
  final int thoigian;
  final int sl;
  final int vang;

  LSObject(
      {required this.uid,
      required this.name,
      required this.tenchude,
      required this.chedo,
      required this.diem,
      required this.thoigian,
      required this.vang,
      required this.sl});
  LSObject.fromJson(Map<dynamic, dynamic> res)
      : uid = res['uid'],
        name = res['name'],
        tenchude = res['tenchude'],
        chedo = res['chedo'],
        diem = res['diem'],
        thoigian = res['thoigian'],
        sl = res['sl'],
        vang = res['vang'];
  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'name': name,
      'tenchude': tenchude,
      'chedo': chedo,
      'diem': diem,
      'thoigian': thoigian,
      'sl': sl,
      'vang': vang,
    };
  }
}
