class UserEntity {
	String uid;
	String name;
	String mobile;
	String avatar;
	String pwd;
	dynamic email;
	dynamic token;

	UserEntity({this.uid, this.name, this.mobile,  this.avatar, this.pwd, this.email, this.token});

	UserEntity.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		name = json['name'];
		mobile = json['mobile'];
		avatar = json['avatar'];
		pwd = json['pwd'];
		email = json['email'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['name'] = this.name;
		data['mobile'] = this.mobile;
		data['avatar'] = this.avatar;
		data['pwd'] = this.pwd;
		data['email'] = this.email;
		data['token'] = this.token;
		return data;
	}
}
