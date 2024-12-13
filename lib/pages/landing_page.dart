import 'package:flutter/material.dart';
import 'package:movie_app/services/Movies_services.dart';
import 'package:movie_app/widget/movie_wigdet.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Center(
          child: Text(
            'Top Movies',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                'Top Movies',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: FutureBuilder(
                future: MovieServices.getMovielist(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.pinkAccent,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.map<Widget>((movieProduct) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.pinkAccent, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.fromLTRB(12, 1, 12, 8),
                          child: MovieWidget(movieModel: movieProduct),
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Failed to load movies.',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
