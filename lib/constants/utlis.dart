extension HumanReadable on String {
  String toReadable() {
    String result;
    if (isEmpty || this == '') {
      result = '0';
    } else {
      RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      mathFunc(Match match) => '${match[1]},';
      result = replaceAllMapped(reg, mathFunc);
    }
    return result;
  }

    
}