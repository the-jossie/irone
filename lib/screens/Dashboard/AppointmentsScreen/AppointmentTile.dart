import 'package:irone/models/Appointment.dart';
import 'package:flutter/material.dart';

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  const AppointmentTile({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 19, right: 18, bottom: 13, left: 27),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          appointment.doctor.imgPath,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 27),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctor.name.length > 22
                            ? appointment.doctor.name.replaceRange(
                                22, appointment.doctor.name.length, "...")
                            : appointment.doctor.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: appointment.doctor.specialty
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
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text("DATE & TIME"),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      appointment.date,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      appointment.time,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
          appointment.isDone
              ? Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "Done",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
