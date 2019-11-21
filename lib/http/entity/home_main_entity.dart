class HomeMainEntity {
	List<HomeMainTypelist> typeList;
	List<String> column;
	List<HomeMainBanner> banner;

	HomeMainEntity({this.typeList, this.column, this.banner});

	HomeMainEntity.fromJson(Map<String, dynamic> json) {
		if (json['typeList'] != null) {
			typeList = new List<HomeMainTypelist>();(json['typeList'] as List).forEach((v) { typeList.add(new HomeMainTypelist.fromJson(v)); });
		}
		column = json['column']?.cast<String>();
		if (json['banner'] != null) {
			banner = new List<HomeMainBanner>();(json['banner'] as List).forEach((v) { banner.add(new HomeMainBanner.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.typeList != null) {
      data['typeList'] =  this.typeList.map((v) => v.toJson()).toList();
    }
		data['column'] = this.column;
		if (this.banner != null) {
      data['banner'] =  this.banner.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeMainTypelist {
	String name;
	int id;
	String type;

	HomeMainTypelist({this.name, this.id, this.type});

	HomeMainTypelist.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}

class HomeMainBanner {
	String clickurl;
	String goodsid;
	String name;
	int id;
	int type;
	String url;

	HomeMainBanner({this.clickurl, this.goodsid, this.name, this.id, this.type, this.url});

	HomeMainBanner.fromJson(Map<String, dynamic> json) {
		clickurl = json['clickurl'];
		goodsid = json['goodsid'];
		name = json['name'];
		id = json['id'];
		type = json['type'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['clickurl'] = this.clickurl;
		data['goodsid'] = this.goodsid;
		data['name'] = this.name;
		data['id'] = this.id;
		data['type'] = this.type;
		data['url'] = this.url;
		return data;
	}
}
