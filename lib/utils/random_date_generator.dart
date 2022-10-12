import 'dart:math';

class RandomDateUtil {
  const RandomDateUtil._();

  static String generateRandomDate() {
    List monthes = [
      'November',
      'December',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
    ];
    Random random = Random();
    int randomMonth = random.nextInt(12);
    int randomDay = random.nextInt(30) + 1;

    final actualDate = '2022 ${monthes[randomMonth]}, $randomDay';
    return actualDate;
  }
}
