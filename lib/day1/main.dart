import 'dart:io';

void main(List<String> args) {
  List<int> input = [];

  File file = File('./input.txt');
  int i = 0;
  file.readAsLinesSync().forEach((line) {
    if (line.trim().isNotEmpty) {
      i += int.parse(line);
    } else {
      input.add(i);
      i = 0;
    }
  });
  input.sort((a, b) => b.compareTo(a));
  int totalTopThree = input[0] + input[1] + input[2];
  print(totalTopThree);
}
