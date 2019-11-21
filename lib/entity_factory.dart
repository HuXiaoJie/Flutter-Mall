import 'package:mall/http/entity/home_limited_time_type_goods_entity.dart';
import 'package:mall/http/entity/home_type_list_entity.dart';
import 'package:mall/http/entity/home_main_entity.dart';
import 'package:mall/http/entity/user_entity.dart';
import 'package:mall/http/entity/home_shop_bar_entity.dart';
import 'package:mall/http/entity/home_limited_time_type_entity.dart';
import 'package:mall/http/entity/home_type_item_content_entity.dart';
import 'package:mall/http/result_data_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeLimitedTimeTypeGoodsEntity") {
      return HomeLimitedTimeTypeGoodsEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeTypeListEntity") {
      return HomeTypeListEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeMainEntity") {
      return HomeMainEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeShopBarEntity") {
      return HomeShopBarEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeLimitedTimeTypeEntity") {
      return HomeLimitedTimeTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeTypeItemContentEntity") {
      return HomeTypeItemContentEntity.fromJson(json) as T;
    } else if (T.toString() == "ResultDataEntity") {
      return ResultDataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}