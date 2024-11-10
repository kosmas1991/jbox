import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jbox/azuracast_provider/azuracast_provider.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/global%20widgets/mysnackbar.dart';
import 'package:jbox/main.dart';
import 'package:jbox/models/requestlist.dart';

class RequestScreen extends StatelessWidget {
  final String terminal;
  const RequestScreen({super.key, this.terminal = ''});

  static final String routeName = '/request';

  @override
  Widget build(BuildContext context) {
    var screenTextStyle = TextStyle(color: Colors.white);
    return Scaffold(
      body: StreamBuilder<Map<String, dynamic>?>(
          stream:
              FirestoreProvider.getAllDataFromParameters(username: terminal),
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
                                                                  .data![index]
                                                                  .requestId ??
                                                              '');
                                              'resp message text ${utf8.decode(response.message!.codeUnits)}'
                                                  .printWarning();
                                              MyApp.snackbarKey.currentState!
                                                  .showSnackBar(mySnackBar(
                                                      utf8.decode(response
                                                          .message!.codeUnits),
                                                      severity:
                                                          response.success!
                                                              ? Severity.success
                                                              : Severity.error,
                                                      duration: Duration(
                                                          seconds: 3)));
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.network(
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        } else {
                                                          return Container(
                                                            width: 60,
                                                            height: 60,
                                                            child: Center(
                                                              child: Container(
                                                                width: 30,
                                                                height: 30,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      3,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      snapshot.data![index].song
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
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Center(
                                          child:
                                              Text(snapshot.error.toString())),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    );
                                  }
                                })),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                            width: 400,
                            height: double.infinity,
                            color: Colors.blueAccent,
                            child: Text('Request a song that not exists')),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
