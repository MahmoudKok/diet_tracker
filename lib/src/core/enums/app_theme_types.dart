import 'package:hive_ce/hive.dart';
import 'package:diet_tracker/src/core/configs/hive_configs/hive_type_ids.dart';
part 'app_theme_types.g.dart';

@HiveType(typeId: HiveTypeIds.themeType)
enum AppThemeType {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
}
