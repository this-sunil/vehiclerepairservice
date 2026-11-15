import 'dart:io';

/// Minimal `.env` reader for the MCP server.
///
/// Deliberately mirrors `flutter_dotenv`'s parsing rules so the server and the
/// Flutter app read the same values from the same file:
///   * optional `export ` prefix
///   * `KEY=value`, split on the first `=`
///   * a value wrapped in quotes ends at the matching closing quote
///   * unquoted values are trimmed and lose a trailing `# comment`
///
/// Line 1 of this project's `.env` is
///   BASE_URL="http://10.0.0.5:4000" //"https://prod.example.com"
/// `flutter_dotenv` reads that as `http://10.0.0.5:4000`, so we do too.
class DotEnv {
  const DotEnv(this._values);

  final Map<String, String> _values;

  String? operator [](String key) => _values[key];

  /// Reads [path] when it exists. Never throws; a missing file is not fatal.
  static DotEnv load(String path) {
    final file = File(path);
    if (!file.existsSync()) return const DotEnv({});
    return DotEnv.parse(file.readAsStringSync());
  }

  static DotEnv parse(String source) {
    final values = <String, String>{};
    for (final rawLine in source.split('\n')) {
      final line = rawLine.trim();
      if (line.isEmpty || line.startsWith('#')) continue;

      final withoutExport =
          line.startsWith('export ') ? line.substring(7).trim() : line;
      final equals = withoutExport.indexOf('=');
      if (equals <= 0) continue;

      final key = withoutExport.substring(0, equals).trim();
      if (key.isEmpty) continue;

      values.putIfAbsent(
        key,
        () => _parseValue(withoutExport.substring(equals + 1).trim()),
      );
    }
    return DotEnv(values);
  }

  static String _parseValue(String raw) {
    if (raw.isEmpty) return '';

    final quote = raw[0];
    if (quote == '"' || quote == "'") {
      final closing = raw.indexOf(quote, 1);
      if (closing > 0) return raw.substring(1, closing);
    }

    final comment = raw.indexOf('#');
    final value = comment >= 0 ? raw.substring(0, comment) : raw;
    return value.trim();
  }
}
