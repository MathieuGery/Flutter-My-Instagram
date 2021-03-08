import 'package:flutter/material.dart';
import 'package:flutter_instagram/Views/single_picture.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    List pictures = [
      NetworkImage(
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
      ),
      NetworkImage(
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
      ),
      NetworkImage(
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
      ),
      NetworkImage(
        'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
      ),
    ];

    onPictureTap() async {
      await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => SinglePicture(userID: ('test'))
        )
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height / 4,
          ),
          Center(
            child:
             Text(
              "Favorites",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32  
                )
              )
          ),
          SizedBox(
            height: height / 20,
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                children: List.generate(pictures.length, (index) {
                  return GestureDetector(
                    onTap: onPictureTap,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: pictures[index]
                        )
                      ),
                    )
                  );
                }) 
              )
            )
          )
        ]
      ),
    );
  }
}
 