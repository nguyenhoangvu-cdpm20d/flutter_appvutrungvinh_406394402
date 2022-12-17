class NapTienObject {
  final String uid;
  final int muoi_nghin;
  final int haimuoi_nghin;
  final int nammuoi_nghin;
  final int mottram_nghin;
  final int haitram_nghin;
  final int namtram_nghin;
  NapTienObject(
      {required this.uid,
      required this.muoi_nghin,
      required this.haimuoi_nghin,
      required this.nammuoi_nghin,
      required this.mottram_nghin,
      required this.haitram_nghin,
      required this.namtram_nghin});
  NapTienObject.fromJson(Map<dynamic, dynamic> res)
      : uid = res['uid'],
        muoi_nghin = res['muoi_nghin'],
        haimuoi_nghin = res['haimuoi_nghin'],
        nammuoi_nghin = res['nammuoi_nghin'],
        mottram_nghin = res['mottram_nghin'],
        haitram_nghin = res['haitram_nghin'],
        namtram_nghin = res['namtram_nghin'];
  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'muoi_nghin': muoi_nghin,
      'haimuoi_nghin': haimuoi_nghin,
      'nammuoi_nghin': nammuoi_nghin,
      'mottram_nghin': mottram_nghin,
      'haitram_nghin': haitram_nghin,
      'namtram_nghin': namtram_nghin,
    };
  }
}
