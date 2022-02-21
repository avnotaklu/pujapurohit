import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:pujapurohit/models/samples.dart';
import 'package:pujapurohit/utils/arti_reader.dart';

class AartiPage extends StatelessWidget {
  var item_no = 0.obs;
  AartiPage(int p_item_no) : item_no = p_item_no.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Row(children: [
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
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
              }),
        ),
      ),
      const VerticalDivider(
        thickness: 0.3,
        color: Colors.black,
      ),
      Obx(
        () => Expanded(
          flex: 4,
          child: AartiDetails(item_no.value),
        ),
      ),
      const VerticalDivider(
        thickness: 0.5,
        color: Colors.black,
      ),
      Obx(
        () => Expanded(
          flex: 3,
          child: Container(child: ArtiAudioPlayer(item_no.value)),
        ),
      )
    ])));
  }
}

class AartiDetails extends StatelessWidget {
  int item_no;
  AartiDetails(this.item_no);
  var style = MarkdownStyleSheet(
    textAlign: WrapAlignment.center,
    h1Align: WrapAlignment.center,
    h1: const TextStyle(color: Colors.orangeAccent, fontSize: 28),
    textScaleFactor: 1.5,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: rootBundle.loadString(artis[item_no].textPath),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data!,
                  styleSheet: style,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
