import 'dart:io';

import 'package:adminfoodapp/data/models/product.dart';
import 'package:adminfoodapp/domain/cubit/product/product_cubit.dart';
import 'package:adminfoodapp/presentation/widgets/custom_button.dart';
import 'package:adminfoodapp/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../domain/cubit/product/product_states.dart';
import '../dialoges/pick_image.dart';
class Home extends StatefulWidget {



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
var image;

  TextEditingController controllerName=TextEditingController();

  TextEditingController controllerdesc=TextEditingController();

  TextEditingController controllerprice=TextEditingController();

  TextEditingController controllercarb=TextEditingController();

  TextEditingController controllercal=TextEditingController();

  TextEditingController controllerfat=TextEditingController();

  TextEditingController controllerpt=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding:  EdgeInsets.all(13.sp),
        child: SingleChildScrollView(
          child:
          BlocBuilder<ProductCubit,ProductStates>(

            builder: (BuildContext context, Object? state) {
              if(state is ImageCamera){
                  image=  ProductCubit.get(context).image;
              }
             if(state is ImageGallery){
              image=  ProductCubit.get(context).image;

              }
              if(state is AddProductDone){
                image= null;
                controllerpt.text='';
                controllercarb.text='';
                controllercal.text='';
                controllerfat.text='';
                controllerName.text='';
                controllerprice.text='';
                controllerdesc.text='';



              }
             return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (builder)=> PickImageDialoge());

                    },
                    child: Container(
                      width: 60.w,
                      height: 25.h,
                      child: image==null?Icon(Icons.add_a_photo,size: 50.sp,):Image.file(image,fit: BoxFit.fill,),
                    ),
                  ),

                  SizedBox(height: 7.sp,),

                  Form(child: Column(children: [
                    TextFormField(
                      controller:controllerName ,

                      decoration: InputDecoration(
                          hintText: 'Add product name'

                      ),

                    ),
                    SizedBox(height: 7.sp,),
                    TextFormField(
                      controller:controllerprice ,

                      decoration: InputDecoration(
                          hintText: 'Add product price'

                      ),

                    ),
                    SizedBox(height: 7.sp,),

                    TextFormField(
                      controller:controllerdesc ,

                      decoration: InputDecoration(
                          hintText: 'Add product description'

                      ),

                    ),
                    SizedBox(height: 7.sp,),

                    TextFormField(
                      controller:controllercal ,

                      decoration: InputDecoration(
                          hintText: 'Add product calories'

                      ),

                    ),
                    SizedBox(height: 7.sp,),

                    TextFormField(
                      controller:controllerfat ,

                      decoration: InputDecoration(
                          hintText: 'Add product fat'

                      ),

                    ),
                    SizedBox(height: 7.sp,),

                    TextFormField(
                      controller:controllercarb ,

                      decoration: InputDecoration(
                          hintText: 'Add product carb'

                      ),

                    ),
                    SizedBox(height: 7.sp,),

                    TextFormField(
                      controller:controllerpt ,

                      decoration: InputDecoration(
                          hintText: 'Add product protein'

                      ),

                    ),
                    SizedBox(height: 30.sp,),





                  ],)),

                  CustomButton('Submit order', (){
                    ProductCubit.get(context).addProduct(
                        ProductModel(
                        name: controllerName.text,
                        id:DateTime.now(),
                        price: controllerprice.text,
                        desc: controllerdesc.text,
                        image: ProductCubit.get(context).imageUrl,
                        calory: controllercal.text,
                        fat: controllerfat.text,
                        carb: controllercarb.text,
                        protein: controllerpt.text),
                    DateTime.now()
                    );
                  })
                ],
              );
            }

          ),
        ),
      ),
    );
  }
}
