import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> getLibraryFullPath(String relativePath) async {
    final libDir = (await getLibraryDirectory()).path;
    return '$libDir/$relativePath';
  }

  static Future<String> getDownloadFilePath(String relativePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final docPath = directory.path;
    return '$docPath/$relativePath';
  }
}
