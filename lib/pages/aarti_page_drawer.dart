 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/samples.dart';

ListView ListViewDrawer(RxInt item_no) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: artis.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
               item_no.value = index;
              },
              child: Card(
                elevation: 7.0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: const Color(0xffFFF3E2),
                // margin: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 80,
                          width: 80.0,
                          child: CircleAvatar(
                            // radius: 16,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              artis[index].imagePath,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 25.0,
                        ),
                        // RichText(text: TextSpan())
                        Expanded(
                          child: Text(
                            artis[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }