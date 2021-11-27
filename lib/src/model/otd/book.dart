import 'dart:convert';

class BookOTD {
  List<dynamic> diemDi;
  List<dynamic> diemDen;
  String date;
  String time;
  String kind;
  List<dynamic> char;

  BookOTD(
      {this.char, this.date, this.diemDen, this.diemDi, this.kind, this.time});

  BookOTD.fromJson(Map<String, dynamic> json)
      : diemDi = json['diemDi'],
        diemDen = json['diemDen'],
        date = json['date'],
        time = json['time'],
        kind = json['kind'],
        char = json['char'];

  Map<String, dynamic> toJson() => {
        'diemDi': jsonEncode(diemDi),
        'diemDen': jsonEncode(diemDen),
        'date': date,
        'time': time,
        'kind': kind,
        'char': jsonEncode(char),
      };
}
