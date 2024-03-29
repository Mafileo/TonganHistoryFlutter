import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils {
  static Future<String> get getFilePath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async{
    final path = await getFilePath;
    return File('$path/pre_contact.txt');
  }

  static Future<String> readFromFile() async{
    try{
      final file = await getFile;
      String fileContents = await file.readAsString();
    }catch(e){
      return "";
    }
  }
}