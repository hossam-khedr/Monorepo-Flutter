import 'package:jiffy/jiffy.dart';

class DateFormatHelper {
  static String toArabicDate(String dateString) {
    Jiffy.setLocale('ar');
    String result = Jiffy.parse(dateString).format(pattern: 'dd MMMM yyyy');
    Jiffy.setLocale('en');
    return result;
  }
}
