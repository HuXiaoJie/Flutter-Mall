class HomeShopBarEntity {
	String uid;
	double allPrice;
	dynamic size;
	String goodsId;
	double price;
	dynamic sex;
	String name;
	int selectCount;
	int id;
	String pic;
	String type;
	int allCount;
	bool select;


	HomeShopBarEntity({this.uid, this.allPrice, this.size, this.goodsId, this.price, this.sex, this.name, this.selectCount, this.id, this.pic, this.type, this.allCount,this.select});

	HomeShopBarEntity.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		allPrice = json['allPrice'];
		size = json['size'];
		goodsId = json['goodsId'];
		price = json['price'];
		sex = json['sex'];
		name = json['name'];
		selectCount = json['selectCount'];
		id = json['id'];
		pic = json['pic'];
		type = json['type'];
		allCount = json['allCount'];
		select =json['select'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['allPrice'] = this.allPrice;
		data['size'] = this.size;
		data['goodsId'] = this.goodsId;
		data['price'] = this.price;
		data['sex'] = this.sex;
		data['name'] = this.name;
		data['selectCount'] = this.selectCount;
		data['id'] = this.id;
		data['pic'] = this.pic;
		data['type'] = this.type;
		data['allCount'] = this.allCount;
		data['select'] =this.select;
		return data;
	}
}
