class HomeLimitedTimeTypeGoodsEntity {
	String goodsId;
	String hint;
	String pic;
	dynamic time;
	String type;

	HomeLimitedTimeTypeGoodsEntity({this.goodsId, this.hint, this.pic, this.time, this.type});

	HomeLimitedTimeTypeGoodsEntity.fromJson(Map<String, dynamic> json) {
		goodsId = json['goodsId'];
		hint = json['hint'];
		pic = json['pic'];
		time = json['time'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['goodsId'] = this.goodsId;
		data['hint'] = this.hint;
		data['pic'] = this.pic;
		data['time'] = this.time;
		data['type'] = this.type;
		return data;
	}
}
