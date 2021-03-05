

import 'package:shoppy/Screens/ConfirmAddress.dart';
import 'package:shoppy/Services/ItemFirebaseConfig.dart';
final String _categorylocCosme = 'asset/Cosmetics/';
final String _categorylocGro = 'asset/Groceries/';
final String _categorylocMedi = 'asset/Medicine/';
class TempDatabase {
  static Map<String,double> factor ={
    'kg-g' : 1/1000,
    'g-kg' : 1000,
  };
  static Map<String,List<String>>unitType = {
    "Weight" : <String>["kg","g"],
    "Pack" : <String>["kg","g"],
    "Piece" : <String>["piece"],
  };
  static final CosmeticsMap = {
    'products': [{
      iShopName : "Krisha",
      iSellerId :  "seller1",
      iImages : <String>[_categorylocCosme+"lipstick1.png",_categorylocCosme+"lipstick2.png",_categorylocCosme+"lipstick3.png"],
      iProductName: "Lipstic",
      iProductType: "Facial",
      iSellingPrice: 25,
      iUnit: "Piece",
      iAvailableQuantity: 10,
      iMRP: 30,
    },
      {
        iShopName : "Gopal",
        iSellerId :  "seller2",
        iImages : <String>[_categorylocCosme+"perfume1.png"],
        iProductName: "Peerfume",
        iProductType: "Deodorants",
        iSellingPrice: 150,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 160,
      },
      {
        iShopName : "Vraj",
        iSellerId :  "seller3",
        iImages : <String>[_categorylocCosme+"fashwash1.png"],
        iProductName: "Fash wash",
        iProductType: "Facial",
        iSellingPrice: 140,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 150,
      },
      {
        iShopName : "Vraj",
        iSellerId :  "seller3",
        iImages : <String>[_categorylocCosme+"hairoil1.png"],
        iProductName: "Hair oil",
        iProductType: "Hair",
        iSellingPrice: 60,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 70,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocCosme+"mackupset1.png",_categorylocCosme+"mackupset2.png"],
        iProductName: "Mack-up set",
        iProductType: "Facial",
        iSellingPrice: 430,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 450,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocCosme+"shampu1.png"],
        iProductName: "Shampu",
        iProductType: "Hair",
        iSellingPrice: 120,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 130,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocCosme+"skinScrub1.png"],
        iProductName: "Skin Srub",
        iProductType: "Facial",
        iSellingPrice: 140,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 150,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocCosme+"eyeliner1.png"],
        iProductName: "Eye Liner",
        iProductType: "Eye",
        iSellingPrice: 45,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 50,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocCosme+"bodyLotion1.png"],
        iProductName: "Body Lotion",
        iProductType: "skin",
        iSellingPrice: 95,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 100,
      },
    ]
  };
  static final GroceryMap = {
    'products': [{
      iShopName : "Vraj raj",
      iSellerId :  "seller4",
      iImages : <String>[_categorylocGro+"rice1.png",_categorylocGro+"rice2.png"],
      iProductName: "Basmati Rise",
      iProductType: "Grains",
      iSellingPrice: 20,
      iUnit: "kg",
      iAvailableQuantity: 10,
      iMRP: 30,
    },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"Almonds1.png"],
        iProductName: "Almonds",
        iProductType: "Dry fruits",
        iSellingPrice: 530,
        iUnit: "kg",
        iAvailableQuantity: 10,
        iMRP: 550,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"kaju1.png"],
        iProductName: "kaju",
        iProductType: "Dry fruits",
        iSellingPrice: 350,
        iSellingType : "Weight",
        iQuantityAsPrice : 500,
        iUnit: "g",
        iAvailableQuantity: 10,
        iMRP: 370,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"wheat1.png"],
        iProductName: "Wheat",
        iProductType: "Grain",
        iSellingPrice: 25,
        iUnit: "KG",
        iAvailableQuantity: 10,
        iMRP: 30,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"cheess1.png"],
        iProductName: "Slice cheese",
        iProductType: "Dairy",
        iSellingPrice: 210,
        iUnit: "G",
        iSellingType : "Pack",
        iQuantityAsPrice : 500,
        iAvailableQuantity: 10,
        iMRP: 230,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"oil1.png"],
        iProductName: "oil ",
        iProductType: "Oil and Fat",
        iSellingPrice: 1700,
        iUnit: "KG",
        iAvailableQuantity: 10,
        iMRP: 180,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"mug1.png",_categorylocGro+"mug2.png"],
        iProductName: "Mung",
        iProductType: "seeds",
        iSellingPrice: 110,
        iSellingType: "Pack",
        iQuantityAsPrice : 1,
        iUnit : "KG",
        iAvailableQuantity: 10,
        iMRP: 120,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"peanut1.png"],
        iProductName: "Peanut",
        iProductType: "seeds",
        iSellingPrice: 80,
        iSellingType : "Weight",
        iQuantityAsPrice : 1,
        iUnit: "KG",
        iAvailableQuantity: 10,
        iMRP: 50,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"chanadal1.png"],
        iProductName: "Chana Dal",
        iProductType: "seeds",
        iSellingPrice: 70,
        iUnit: "KG",
        iAvailableQuantity: 10,
        iMRP: 75,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocGro+"chana1.png"],
        iProductName: "Chana Dal",
        iProductType: "seeds",
        iSellingPrice: 45,
        iUnit: "KG",
        iAvailableQuantity: 10,
        iMRP: 50,
      }],
  };
  static final MedicineMap = {
    'products': [{
      iShopName : "Vraj raj",
      iSellerId :  "seller4",
      iImages : <String>[_categorylocMedi+"cholera1.png"],
      iProductName: "Cholera vaccine",
      iProductType: "Dose",
      iSellingPrice: 48,
      iUnit: "Piece",
      iAvailableQuantity: 10,
      iMRP: 50,
    },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocMedi+"covid19v1.png"],
        iProductName: "Covid-19 vaccine",
        iProductType: "Dose",
        iSellingPrice: 100,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 120,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>[_categorylocMedi+"polio1.png"],
        iProductName: "Polio vaccine",
        iProductType: "Dose",
        iSellingPrice: 40.50,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 44,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "Amphotericin B",
        iProductType: "Teblet",
        iSellingPrice: 60.5,
        iUnit: "Pack",
        iAvailableQuantity: 10,
        iMRP: 66 ,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "Bosentan",
        iProductType: "Teblet",
        iSellingPrice: 20.75,
        iUnit: "Pack",
        iAvailableQuantity: 10,
        iMRP: 25 ,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "Captopril",
        iProductType: "Teblet",
        iSellingPrice: 80,
        iUnit: "Pack",
        iAvailableQuantity: 10,
        iMRP: 85 ,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "calcium",
        iProductType: "Teblet",
        iSellingPrice: 100,
        iUnit: "Pack",
        iAvailableQuantity: 10,
        iMRP: 110 ,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "Hepatitis",
        iProductType: "Dose",
        iSellingPrice: 75.80,
        iUnit: "Piece",
        iAvailableQuantity: 10,
        iMRP: 80 ,
      },
      {
        iShopName : "Vraj raj",
        iSellerId :  "seller4",
        iImages : <String>['asset/Icon.jpg'],
        iProductName: "acyclovir capsule",
        iProductType: "Capsule",
        iSellingPrice: 200,
        iUnit: "pack",
        iAvailableQuantity: 10,
        iMRP: 210 ,
      }
    ],
  };
}