import '/models/doctor.dart';

class DoctorService {
  Future getDoctors() async {
    return Doctors().items;
  }
}
