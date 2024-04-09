import 'package:firebase_performance/firebase_performance.dart';

class PerformanceService{
  FirebasePerformance _performance = FirebasePerformance.instance;

PerformanceService(){
    init();
  }
  void init() async{
    await _performance.setPerformanceCollectionEnabled(true);
  }
  
}