import 'package:jiffy/jiffy.dart';

class DateFormatHelper {

  static String formatDate(DateTime date, String pattern, {String? locale}) {
    Jiffy.setLocale(locale??'en');
    return Jiffy.parseFromDateTime(date).format(pattern: pattern);
  }
  static String toArabicDate(String dateString) {
    Jiffy.setLocale('ar');
    String result = Jiffy.parse(dateString).format(pattern: 'dd MMMM yyyy');
    Jiffy.setLocale('en');
    return result;
  }
}
