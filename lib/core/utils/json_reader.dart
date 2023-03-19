import 'dart:io';

String jsonReader(String name) => File('assets/responses/${name}_response.json').readAsStringSync();
