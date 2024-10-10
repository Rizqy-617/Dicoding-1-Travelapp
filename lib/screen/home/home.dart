import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/route.dart';
import 'package:travenor/constant/theme_colors.dart';
import 'package:travenor/model/category_model.dart';
import 'package:travenor/model/product_model.dart';
import 'package:travenor/widget/category_card.dart';
import 'package:travenor/widget/popular_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CategoryModel category;
  late ProductModel product;
  List<CategoryModel> listCategory = [];
  List<ProductModel> listProduct = [];
  bool isLoading = true;
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      String stringDataCategories = await rootBundle.loadString("assets/json/dummy_categories.json");
      List dataFromJson = await jsonDecode(stringDataCategories);
      if (dataFromJson.isNotEmpty) {
        for (int i = 0; i < dataFromJson.length; i++) {
          category = CategoryModel.fromMap(dataFromJson[i]);
          listCategory.add(category);
        }
      }
      String stringDataPopular = await rootBundle.loadString("assets/json/dummy_popular.json");
      List dataPopularFromJson = await jsonDecode(stringDataPopular);
      if (dataPopularFromJson.isNotEmpty) {
        for (int i = 0; i < dataPopularFromJson.length; i++) {
          product = ProductModel.fromMap(dataPopularFromJson[i]);
          listProduct.add(product);
        }
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      appBar: AppBar(
        foregroundColor: ThemeColors.white,
        backgroundColor: ThemeColors.white,
        scrolledUnderElevation: 0,
        leadingWidth: 230,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: ThemeColors.bgGrey,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ThemeColors.action,
                  shape: BoxShape.circle
                ),
                child: Image.asset(
                  "assets/icon/other/profile_picture.png",
                  width: 30,
                  height: 30,
                ),
              ),
              Text(
                "Rizqy Andriansyah",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: ThemeColors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ThemeColors.bgGrey,
              shape: BoxShape.circle
            ),
            alignment: Alignment.center,
            child: const FaIcon(
              FontAwesomeIcons.bell,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: isLoading ? Center(
            child: CircularProgressIndicator(
              color: ThemeColors.primary,
            ),
          ) : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where do you \nwant to explore today?",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.black
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: ThemeColors.bgGrey
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search destination",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ThemeColors.subText
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 25,
                        color: ThemeColors.subText,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose Category",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.black
                      ),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.subText
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (context, index) {
                      bool active = index == selectedCategory;
                      return Padding(
                        padding: index == 0 ? const EdgeInsets.only(right: 5) : const EdgeInsets.symmetric(horizontal: 5),
                        child: CategoryCard(
                          image: listCategory[index].image,
                          title: listCategory[index].name,
                          active: active,
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listProduct.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0 ? const EdgeInsets.only(bottom: 10) : const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.detail, arguments: listProduct[index]);
                        },
                        child: PopularCard(
                          name: listProduct[index].name,
                          image1: listProduct[index].image1,
                          description: listProduct[index].description,
                          price: listProduct[index].price,
                          rating: listProduct[index].rating,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}