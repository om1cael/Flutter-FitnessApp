import "package:fitness/enums/difficult.dart";
import "package:fitness/models/category_model.dart";
import "package:fitness/models/diet_recommendation_model.dart";
import "package:fitness/models/popular_model.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(),
            SizedBox(height: 40,),
            CategoriesSection(categories: categories),
            SizedBox(height: 40,),
            DietRecommendation(dietRecommendations: dietRecommendations),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 315,
                          height: 80,
                          decoration: BoxDecoration(
                            color: popularRecommendations[index].isActive ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff1D1617).withValues(alpha: 0.11),
                                blurRadius: 40,
                                spreadRadius: 0.0,
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(popularRecommendations[index].iconPath),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      popularRecommendations[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),

                                    Text(
                                      '${popularRecommendations[index].difficult.name} | ${popularRecommendations[index].time} mins | ${popularRecommendations[index].kcal}kcal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset('assets/icons/button.svg')
                              ],
                            ),
                          ),
                        );
                      }, 
                      separatorBuilder: (context, index) => SizedBox(height: 30,), 
                      itemCount: popularRecommendations.length
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }

  final List<CategoryModel> categories = [
    CategoryModel(
      name: 'Salad', 
      iconPath: 'assets/icons/plate.svg', 
      boxColor: Color(0xff92A3FD)
    ),
    CategoryModel(
      name: 'Cake', 
      iconPath: 'assets/icons/pancakes.svg', 
      boxColor: Color(0xffC58BF2)
    ),
    CategoryModel(
      name: 'Pie', 
      iconPath: 'assets/icons/pie.svg', 
      boxColor: Color(0xff92A3FD)
    ),
    CategoryModel(
      name: 'Smoothies', 
      iconPath: 'assets/icons/orange-snacks.svg', 
      boxColor: Color(0xffC58BF2)
    ),
  ];

  final List<DietRecommendationModel> dietRecommendations = [
    DietRecommendationModel(
      name: 'Honey Pancake', 
      iconPath: 'assets/icons/honey-pancakes.svg', 
      boxColor: Color(0xff92A3FD),
      difficult: Difficult.Easy, 
      time: 30, 
      kcal: 180,
      hasActiveButton: true,
    ),
    DietRecommendationModel(
      name: 'Canai Bread', 
      iconPath: 'assets/icons/canai-bread.svg', 
      boxColor: Color(0xffC58BF2),
      difficult: Difficult.Easy, 
      time: 20, 
      kcal: 230,
      hasActiveButton: false,
    ),
  ];

  final List<PopularModel> popularRecommendations = [
    PopularModel(
      name: 'Blueberry Pancake', 
      iconPath: 'assets/icons/blueberry-pancake.svg', 
      difficult: Difficult.Medium, 
      time: 30, 
      kcal: 230,
      isActive: true,
    ),
    PopularModel(
      name: 'Salmon Nigiri', 
      iconPath: 'assets/icons/salmon-nigiri.svg', 
      difficult: Difficult.Medium, 
      time: 20,
      kcal: 120,
      isActive: false,
    ),
  ];
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.11),
            blurRadius: 40,
            spreadRadius: 0.0
          )
        ] 
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Pancake',
          hintStyle: TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
            ),
          ),
          suffixIcon: SizedBox(
            width: 60,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg'
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25,),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }
}

class DietRecommendation extends StatelessWidget {
  const DietRecommendation({
    super.key,
    required this.dietRecommendations,
  });

  final List<DietRecommendationModel> dietRecommendations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Container(
            height: 239,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 30,),
              scrollDirection: Axis.horizontal,
              itemCount: dietRecommendations.length,
              itemBuilder: (context, index) {
                return Container(    
                  width: 200,
                  decoration: BoxDecoration(
                    color: dietRecommendations[index].boxColor.withAlpha(100),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 15,
                    children: [
                      SvgPicture.asset(
                        dietRecommendations[index].iconPath
                      ),
                      Column(
                        spacing: 5,
                        children: [
                          Text(
                            dietRecommendations[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            '${dietRecommendations[index].difficult.name} | ${dietRecommendations[index].time} mins | ${dietRecommendations[index].kcal}kcal',
                            style: TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      ),
    
                      if(dietRecommendations[index].hasActiveButton) Container(
                        height: 38,
                        width: 110,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff92A3FD),
                            Color(0xFF9DCEFF)
                          ]),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: (
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              fixedSize: Size(110, 38)
                            ),
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          )
                        ),
                      ) else (
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            fixedSize: Size(110, 38)
                          ),
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Color(0xffC58BF2),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                );
              },  
            ),
          ),
        ),
      ],
    );
  }
}