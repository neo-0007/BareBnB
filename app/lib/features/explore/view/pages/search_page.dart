import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey.withAlpha(50), width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(Icons.close_rounded, color: Color(0xFF252525)),
        ),
      ),
    )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.grey.withAlpha(50), width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,15,15),
                    child: Text(
                      'Where to?',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for a location',
                          hintStyle: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                          prefixIcon: Icon(Icons.search,size: 15,),
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color(0xFF252525).withAlpha(70)),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color(0xFF252525).withAlpha(70)),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color(0xFF252525).withAlpha(70)),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
