import 'dart:convert';
import 'package:flutter/material.dart';
//import '../utils/colorsapp.dart';
//import './product_details.dart';
//import '../utils/constants.dart' as globals;
// import '../repository/category_list.dart' as categories ;
//import '../models/category_fields.dart';
import 'package:http/http.dart' as http;
//import '../utils/languages.dart';
//import '../utils/all_translations.dart';
//import './homepage.dart';
//import './category_sub.dart';
//import './appbar.dart';
//import '../repository/category_main_repository.dart';
//import '../utils/maincategory_body.dart';
//import '../utils/bottombar.dart';


class BuildMainCategory extends StatefulWidget {
  @override
  _BuildMainCategoryState createState() => _BuildMainCategoryState();
}

class _BuildMainCategoryState extends State<BuildMainCategory> {
  List<CategoryFields> list = List();
  var isFoundList = false;
  var isLoading = false;

  // _BuildMainCategoryState(){ getMainCatData();}

  Future<CategoryFields> getMainCatData() async {
    final String urlFstPart = "${globals.gs_url_ip_address_for_api}${globals.gs_url_middle_part_for_api}";
    final String urlMainCat = "product/category/maincategory/?M=${globals.curCom}&C=${globals.curUserPeriority}";

    String url = urlFstPart + urlMainCat ;
    String token =  globals.userToken ;

    setState(() {
      isLoading = true;
    });
    final response =
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Token $token', // Opend to all Users
    }
    );

    if (response.statusCode == 200) {
      isFoundList = true;
      String bodyutf8 = utf8.decode(response.bodyBytes);

      list = (json.decode(bodyutf8) as List)
      // list = (json.decode(response.body) as List)
          .map((data) => new CategoryFields.fromJson(data))
          .toList();

      setState(() {
        isLoading = false;
      });

    } else {
      isFoundList = false;
      throw Exception('Failed to load main Categories  ' + response.body);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // print("===========================Inside initState Before Call ");
    getMainCatData();
    // print("===========================Inside initState After Call ");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: APP_BACKGROUND_Pages_COLOR,
      bottomNavigationBar: BottomBar(thiscontext:context).getBottomBar(false,false,false),
      // bottomNavigationBar: BottomBar(context),
      appBar: new AppBarSection(thiscontext:context, viewCart:true).getAppBar('app_title'),
      body:
      // isLoading ? CircularProgressIndicator() :
      isLoading ? Center( child: CircularProgressIndicator(),) :
      // MainCategoryBody(context, list),
      ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.of(context).push (new MaterialPageRoute( builder: (context) => new CategorySubPerMain( list[index].id ) )  ),
              child:
              Card(
                margin: EdgeInsets.all(6.0),
                semanticContainer: true,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15.0),
                  title: new Text((globals.gs_app_language == 'ar' ? list[index].cATArbName : list[index].cATEngName)),
                  // trailing: FadeInImage(image: NetworkImage('${globals.gs_url_ip_address_for_api}${list[index].cATPicture}'),
                  //                         placeholder: AssetImage('/media/no_image.png'),),// Image.network('${globals.gs_url_ip_address_for_api}${list[index].cATPicture}',),
                  // trailing: new Image.network(globals.gs_url_ip_address_for_api + list[index].cATPicture ?? globals.gs_url_ip_address_for_api + '/media/no_image.png',),
                  trailing: ClipRRect(
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Image.network( ( globals.gs_aws_url_for_assest + list[index].cATPicture ?? globals.gs_aws_url_for_static + '/media/noimage.png' ),
                      fit:BoxFit.fill,
                      alignment: Alignment.topRight,
                      // height: 100.0,
                      // width:120.0
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );

  }
}

