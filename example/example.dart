import 'package:srt_parser_2/srt_parser_2.dart';

const String data = '''1
00:02:26,407 --> 00:02:31,356  X1:100 X2:100 Y1:100 Y2:100
+ time to move on, <u><b><font color="#00ff00">Arman</font></b></u>.
- OK, will do.

2
00:02:31,567 --> 00:02:37,164 
+ Lukas is publishing his library.
- I like the man.
''';

void main() {
  List<Subtitle> subtitles = parseSrt(data);
  for (Subtitle item in subtitles) {
    print('subtitle\'s ID is: ${item.id}');
    print(
        'subtitle\'s Begin is: ${item.range.begin} and End is: ${item.range.end}');
    item.parsedLines.forEach((Line line) {
      return line.subLines.forEach((SubLine subLine) => print(
          'line${item.parsedLines.indexOf(line)} subline${line.subLines.indexOf(subLine)} is: ${subLine.rawString}'));
    });
    print('----');
  }
  if (subtitles[0].parsedLines[0].subLines[1].htmlCode.b == true) {
    print('true');
  }
}
