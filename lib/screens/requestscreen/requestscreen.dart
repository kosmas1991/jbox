import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jbox/azuracast_provider/azuracast_provider.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/global%20widgets/mysnackbar.dart';
import 'package:jbox/main.dart';
import 'package:jbox/models/requestlist.dart';

class RequestScreen extends StatefulWidget {
  final String terminal;
  const RequestScreen({super.key, this.terminal = ''});

  static final String routeName = '/request';

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenTextStyle = TextStyle(color: Colors.white);
    return Scaffold(
      body: StreamBuilder<Map<String, dynamic>?>(
          stream: FirestoreProvider.getAllDataFromParameters(
              username: widget.terminal),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            var data = snapshot.data;
            if (data == null) {
              return Center(
                child: Text(
                    'Σφάλμα, βρέθηκε διπλή εγγραφή (username) στην βάση δεδομένων'),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data['backgroundImage']),
                        fit: BoxFit.cover)),
                //! REQUEST screen contents here
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 8,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 400,
                              color: Colors.black87,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  cursorColor: Colors.white,
                                  controller: textEditingController,
                                  onChanged: (value) {
                                    //empty setstate just to refresh the new data
                                    setState(() {});
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText:
                                          'Αναζήτηση τραγουδιού ή καλλιτέχνη',
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 15,
                              child: Container(
                                height: double.infinity,
                                width: 400,
                                color: Colors.black87,
                                child: StreamBuilder<List<RequestSong>>(
                                  stream: AzuracastProvider.RequestListStream(
                                    url: data['azuracastURL'],
                                    // stationID: 1,
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      //! HAS DATA, SHOW THE DATA :D
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: ListView.builder(
                                          itemCount: snapshot.data?.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () async {
                                                var response =
                                                    await AzuracastProvider
                                                        .getRequestSongResponse(
                                                            url: data[
                                                                'azuracastURL'],
                                                            stationID: 1,
                                                            requestID: snapshot
                                                                    .data![
                                                                        index]
                                                                    .requestId ??
                                                                '');
                                                // 'resp message text ${utf8.decode(response.message!.codeUnits)}'
                                                //     .printWarning();
                                                MyApp.snackbarKey.currentState!
                                                    .showSnackBar(mySnackBar(
                                                        utf8.decode(response
                                                            .message!
                                                            .codeUnits),
                                                        severity: response
                                                                .success!
                                                            ? Severity.success
                                                            : Severity.error,
                                                        duration: Duration(
                                                            seconds: 3)));
                                              },
                                              child: searchResult(
                                                      snapshot, index)
                                                  ? Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.network(
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                } else {
                                                                  return Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          strokeWidth:
                                                                              3,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              snapshot
                                                                      .data![
                                                                          index]
                                                                      .song
                                                                      ?.art ??
                                                                  '',
                                                              width: 60,
                                                              height: 60,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 300,
                                                                  child: Text(
                                                                    '${snapshot.data?[index].song?.title}',
                                                                    style:
                                                                        screenTextStyle,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 300,
                                                                  child: Text(
                                                                    '${snapshot.data?[index].song?.artist}',
                                                                    style:
                                                                        screenTextStyle,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                            );
                                          },
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Center(
                                            child: Text(
                                                snapshot.error.toString())),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Flexible(
                      //   flex: 2,
                      //   child: Container(
                      //       width: 400,
                      //       height: double.infinity,
                      //       color: Colors.blueAccent,
                      //       child: Text('Request a song that not exists')),
                      // ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  bool searchResult(AsyncSnapshot<List<RequestSong>> snapshot, int index) {
    return snapshot.data![index].song!.artist!
            .toLowerCase()
            .contains(textEditingController.text.toLowerCase()) ||
        snapshot.data![index].song!.title!
            .toLowerCase()
            .contains(textEditingController.text.toLowerCase());
  }
}
