import 'dart:io';

import 'package:adminfoodapp/data/models/product.dart';
import 'package:adminfoodapp/domain/cubit/product/product_states.dart';
import 'package:adminfoodapp/presentation/dialoges/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(LoadingProduct());

  static ProductCubit get(context) => BlocProvider.of(context);
var image;
  var imageUrl;
FirebaseFirestore firestor=FirebaseFirestore.instance;
FirebaseAuth auth=FirebaseAuth.instance;
var doc;


  addProduct(ProductModel productModel,var id)async{
    emit(LoadingProduct());
    await uploadImageFireBase(id);
     firestor.collection('products').doc(id.toString()).set(productModel.toJson()).then((value) => {


   })
       .catchError((onError) {
    print(onError);

    emit(AddProductFailed());

    showToast(msg: onError.toString(), state: ToastedStates.WARNING);
  });
    showToast(msg: 'Done2', state: ToastedStates.SUCCESS);

    emit(AddProductDone());

  }


  uploadImageFireBase(var id) async {
    FirebaseStorage storage =
    FirebaseStorage.instanceFor(bucket: 'foodapp-ec382.appspot.com');
    Reference ref = storage.ref().child('proImg').child(id.toString());

    await ref.putFile(image!).whenComplete(() => {

        showToast(msg: 'Done1', state: ToastedStates.SUCCESS)

    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);

    });

    imageUrl = await ref.getDownloadURL();
  }

  pickFromCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
     image = File(img!.path);
    Navigator.of(context).pop();
    print(image);
    emit(ImageCamera());

  }
  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
         image = File(
        img!.path,
      );
    Navigator.of(context).pop();
    print(image);
    emit(ImageGallery());


  }
}