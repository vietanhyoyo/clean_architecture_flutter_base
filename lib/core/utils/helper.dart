class Helper {
  static String addThousandSeparator(int number) {
    // Convert the number to a string
    String numberStr = number.toString();
    StringBuffer buffer = StringBuffer();

    // Counter for the number of digits
    int count = 0;

    // Loop through the string in reverse (from the end to the beginning)
    for (int i = numberStr.length - 1; i >= 0; i--) {
      // Add the current digit to the buffer
      buffer.write(numberStr[i]);
      count++;

      // Add a dot after every three digits, except at the start of the string
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }

    // Reverse the buffer to get the correctly formatted string
    return buffer.toString().split('').reversed.join('');
  }
}
