import 'package:get_it/get_it.dart';

GetIt getItInstance = GetIt.instance;

Future setup() async {  
  getItInstance.allowReassignment = true;
}