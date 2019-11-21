class HomeTypeListEntity {
	String name;
	int id;
	bool select;

	HomeTypeListEntity({this.name, this.id,this.select});

	HomeTypeListEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		select = json['select'];

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['select'] = this.select;
		return data;
	}
}
