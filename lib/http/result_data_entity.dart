class ResultDataEntity {
  String msg;
  int res;
  var info;

  ResultDataEntity({this.msg, this.res, this.info});

  ResultDataEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    res = json['res'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['res'] = this.res;
    data['info'] = this.info;
    return data;
  }
}
