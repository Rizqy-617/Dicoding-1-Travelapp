import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/constant/theme_colors.dart';
import 'package:travenor/model/product_model.dart';
import 'package:travenor/widget/button_block.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key});

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  ProductModel product = ProductModel.init();
  List<String> listImage = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      product = ModalRoute.of(context)!.settings.arguments as ProductModel;
      listImage.add(product.image1);
      listImage.add(product.image2);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Theme(
                    data: ThemeData().copyWith(
                      primaryColor: ThemeColors.primary
                    ),
                    child: Swiper(
                      itemCount: listImage.length,
                      pagination: const SwiperPagination(
                        margin: EdgeInsets.all(20),
                        builder: SwiperPagination.dots
                      ),
                      itemBuilder: (context, index) {
                        return Image.asset(
                          listImage[index],
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          fit: BoxFit.cover,
                        );
                      }
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.bgGrey,
                        backgroundBlendMode: BlendMode.softLight
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: ThemeColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ThemeColors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: ThemeColors.black
                          ),
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.solidStar,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.rating,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: ThemeColors.subText
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 25,
                              color: ThemeColors.subText,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              product.address,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: ThemeColors.subText
                              ),
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: "\$${product.price}",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: ThemeColors.primary
                            ),
                            children: [
                              TextSpan(
                                text: "/Person",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: ThemeColors.subText
                                )
                              )
                            ]
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.black
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeColors.subText
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ThemeColors.white
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: BtnBlock(
              onTap: () {},
              title: "Booking",
              bgColor: ThemeColors.primary,
              txtColor: ThemeColors.white,
            ),
          ),
        ],
      ),
    );
  }
}