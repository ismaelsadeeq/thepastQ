import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/pass_q_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';

class SinglePastQ extends StatefulWidget {

  const SinglePastQ(
      {Key? key,
      }
      ) : super(key: key);

  @override
  _SinglePastQState createState() => _SinglePastQState();
}

class _SinglePastQState extends State<SinglePastQ> {
  PassQData data = PassQData('', '', '', '');
  String message = '';
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings?.arguments as PassQData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400
                ),
              ),
              ElevatedButton(
                  onPressed: ()async{
                    try {
                      // Saved with this method.
                      var imageId = await ImageDownloader.downloadImage('${data.source}');
                      if (imageId == null) {
                        setState(() {
                          message = "oops! something went wrong";
                        });
                        showAlertDialog(context);
                        return;
                      }
                      // Below is a method of obtaining saved image information.
                      var fileName = await ImageDownloader.findName(imageId);
                      var path = await ImageDownloader.findPath(imageId);
                      var size = await ImageDownloader.findByteSize(imageId);
                      var mimeType = await ImageDownloader.findMimeType(imageId);
                      setState(() {
                        message = "picture saved";
                      });
                      // showAlertDialog(context);
                    }  catch (error) {
                      setState(() {
                        message = "picture saved";
                      });
                      // showAlertDialog(context);
                      print(error);

                    }
                  }, child:Icon(Icons.save)
              )
            ],
          )
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(
          width: 450,
          height: 500,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data.title,
                style:GoogleFonts.roboto(
                    color:Colors.blueAccent,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Center(
              child: Text(
                data.year,
                style:GoogleFonts.roboto(
                    color:Colors.blueAccent,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                child: Image.network(
                  '${data.source}',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // Init
    AlertDialog dialog = AlertDialog(
      title: Text("$message"),
      actions: [
        ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            }
        )
      ],
    );
    // Show the dialog (showDialog() => showGeneralDialog())
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {return Wrap();},
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform(
          transform: Matrix4.translationValues(
            0.0,
            (1.0-Curves.easeInOut.transform(anim1.value))*400,
            0.0,
          ),
          child: dialog,
        );
      },
      transitionDuration: Duration(milliseconds: 400),
    );
  }
}
