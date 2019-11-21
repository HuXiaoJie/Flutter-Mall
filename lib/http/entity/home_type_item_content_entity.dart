class HomeTypeItemContentEntity {
	String goodsId;
	String name;
	int id;
	String pic;
	String type;

	HomeTypeItemContentEntity({this.goodsId, this.name, this.id, this.pic, this.type});

	HomeTypeItemContentEntity.fromJson(Map<String, dynamic> json) {
		goodsId = json['goodsId'];
		name = json['name'];
		id = json['id'];
		pic = json['pic'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['goodsId'] = this.goodsId;
		data['name'] = this.name;
		data['id'] = this.id;
		data['pic'] = this.pic;
		data['type'] = this.type;
		return data;
	}
}
