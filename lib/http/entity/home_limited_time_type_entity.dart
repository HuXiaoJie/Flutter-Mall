class HomeLimitedTimeTypeEntity {
	String name;
	String type;

	HomeLimitedTimeTypeEntity({this.name, this.type});

	HomeLimitedTimeTypeEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['type'] = this.type;
		return data;
	}
}
