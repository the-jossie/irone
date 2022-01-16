import 'package:irone/models/Doctor.dart';
import 'package:irone/screens/Dashboard/DoctorProfile/index.dart';
import 'package:flutter/material.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  const DoctorTile({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DoctorProfile.routeName,
        arguments: DoctorProfileArguments(doctor: doctor),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9F6F4),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    doctor.imgPath,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name.length > 22
                      ? doctor.name.replaceRange(22, doctor.name.length, "...")
                      : doctor.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: doctor.specialty
                      .map(
                        (spec) => Text(
                          '• $spec ',
                          style: const TextStyle(
                            color: Color(0xff393938),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: List.filled(
                        doctor.stars,
                        const Image(
                          image: AssetImage("assets/star.png"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${doctor.reviews} reviews",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                          color: Theme.of(context).accentColor),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${doctor.yearsOfExp} •Years Experience",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
