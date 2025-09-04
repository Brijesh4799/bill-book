import 'package:BillBook/presentaion/homescreen_documents_pdf/quotation_pdf/model/quotation_pdf_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_dropDownWithInputText.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/QuotationProvider.dart';

class QuotationScreen extends StatefulWidget {
  final String mobileNumber;
  final QuotationPdfModel? quotationData;


  //const QuotationScreen({super.key});
  const QuotationScreen({Key? key, required this.mobileNumber, this.quotationData}) : super(key: key);

  @override
  _QuotationScreenState createState() => _QuotationScreenState();
}

class _QuotationScreenState extends State<QuotationScreen> {
  // Controllers for Quotation Details
  final TextEditingController quotationNumberController =
      TextEditingController();
   TextEditingController companyNameController = TextEditingController();
// TextEditingController companyGSTController = TextEditingController();
  TextEditingController partyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController quotationDateController = TextEditingController();
  final TextEditingController packingDateController = TextEditingController();
  final TextEditingController shiftingDateController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();

  String? selectedGstPercent; // for GST%
  String? selectedGstType;    // for GST TYPE


  // Dropdown selected value
  String? selectedQutationDetailsDropDownValue;
  List<String> QuotaionDetaildropdownItems = [
    'Local',
    'Domestic',
    'International',
    'House Hold Goods'
    'Office Shifting',
    'Industrial Goods Shifting',
    'Car Shifting',
    'House Hold Goods And Car Shifting',
    'Bike Shifting',
    'House Hold Goods And Bike Shifting',
    'Car And Bike Shifting',
    'House Hold Goods, Bike And Car Shifting',
  ];

  final TextEditingController moveFromCountryController = TextEditingController(text:'India');
  final TextEditingController moveFromStateController = TextEditingController(text:'New Delhi');
  final TextEditingController moveFromCityController = TextEditingController();
  final TextEditingController moveFromPincodeController =
      TextEditingController();
  final TextEditingController moveFromAddressController =
      TextEditingController();

  // Dropdowns
  String? selectedFromFloor;
  String? selectedFromLiftAvailable;


  List<String> floorOptions = [];
  List<String> liftOptions = ['Yes', 'No'];

  // Controllers for Move To section
  final TextEditingController moveToCountryController = TextEditingController();
  final TextEditingController moveToStateController = TextEditingController();
  final TextEditingController moveToCityController = TextEditingController();
  final TextEditingController moveToPincodeController = TextEditingController();
  final TextEditingController moveToAddressController = TextEditingController();
  final TextEditingController GSTperController = TextEditingController();
  final TextEditingController insuranceChargeController = TextEditingController();
  final TextEditingController loadingunlodingcontroller = TextEditingController();
  final TextEditingController loadingunloadingorgincontroller = TextEditingController();
  final TextEditingController movingtypecontrooler = TextEditingController();
  final TextEditingController moveformfloorcontoller = TextEditingController();
  final TextEditingController moveformliftcontoller = TextEditingController();
  final TextEditingController movetocontroller = TextEditingController();
  final TextEditingController movetoliftcontoller = TextEditingController();
  final TextEditingController gstshowingcontoller = TextEditingController();
  final TextEditingController gtspershowingcontolller = TextEditingController();
  final TextEditingController gsttypecontroller = TextEditingController();
  final TextEditingController insurancepergstController = TextEditingController();
  final TextEditingController insurancetypecontroller = TextEditingController();
  final TextEditingController vehicalinsurencecontoller = TextEditingController();
  final TextEditingController InsuranceFOVcontroller = TextEditingController();

  // Dropdowns
  String? selectedToFloor;
  String? selectedToLiftAvailable;

  String? packingChargeOption;
  String? unpackingChargeOption;
  String? loadingChargeOption;
  String? unloadingChargeOption;
  String? packingMaterialChargeOption;
  String? surchargeOption;
  String? surchargeOption2;
  String? gstOption;

  // Common dropdown items
  final List<String> chargeOptions = [
    'Included in Freight',
    'Extra',
    'Not Applicable',
  ]; final List<String> chargeOptions2 = [
    '1 %',
    '2 %',
    '3 %',
  ];
  final List<String> gstOptions = [
    'GST CHARGE SHOW IN QUOTATION',
    'GST CHARGE HIDE IN QUOTATION',
  ];



  String? selectedInsuranceType;
  String? selectedGst;
  String? selectedInsuranceChargeValue;
  String? selectedGstValue;



  String? selectedVehicleInsuranceType;
  String? selectedVehicleInsuranceCharge;
  String? selectedVehicleInsuranceGst;

 TextEditingController gotDownItemsController = TextEditingController();

  String? selectedAccessLoadUnload;
  String? selectedLoadingRestrictions;

  List<ListItem> particularItemsDetails = [];


  @override
  void initState() {
    super.initState();
    String todayDate = HelperFunctions().formatDateToDDMMYYYY(DateTime.now());
    quotationDateController.text = todayDate;
    packingDateController.text = todayDate;
    shiftingDateController.text = todayDate;
    floorOptions = generateFloorOptions(100);
  }
  List<String> generateFloorOptions(int maxFloor) {
    List<String> floorOptions = ['Ground'];

    for (int i = 1; i <= maxFloor; i++) {
      String suffix;
      if (i % 10 == 1 && i % 100 != 11) {
        suffix = 'st';
      } else if (i % 10 == 2 && i % 100 != 12) {
        suffix = 'nd';
      } else if (i % 10 == 3 && i % 100 != 13) {
        suffix = 'rd';
      } else {
        suffix = 'th';
      }
      floorOptions.add('$i$suffix');
    }

    return floorOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Quotation'),
      body:
      Consumer<QuatationProvider>(builder: (context, provider, child) {
        return
        SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQuotationDetailsTile(),
              _buildMoveFromTile(),
              _buildMoveToTile(),
              _buildPaymentDetailsTile(),
              _buildInsuranceFOVTile(),
              _buildVehicleInsuranceTile(),
              _buildOtherDetailsTile(),
              _buildItemDetailsTile(),


              const SizedBox(height: 80),
            ],
          ),
        );
      }
      ),


      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<QuatationProvider>(
            builder: (context, provider, child) {
              return ElevatedButton(
                onPressed: () async {
                  HelperFunctions helper = HelperFunctions();
                  bool isConnected = await helper.isConnected();

                  if (!isConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No internet connection')),
                    );
                    return;
                  }

                  await provider.quotationdetails(
                    mobileNumber: widget.mobileNumber,
                    context: context,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeNavController()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Full width button
                  backgroundColor: Colors.blue, // Customize as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Quotation',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),



    );
  }
  Widget _buildQuotationDetailsTile() {
    return Consumer<QuatationProvider>(
      builder: (context, provider, child) {
        return _expansionTileWrapper(
          title: 'Quotation Details (कोटेशन का विवरण)',
          children: [
            inputTextFields(
              inputType: TextInputType.number,
              label: 'Quotation Number (कोटेशन नंबर)',
              textEditingController: provider.quotationNumberController,
            ),


        /*customDropdown(
        label: 'Moving Type (मूविंग के प्रकार)',
        items: QuotaionDetaildropdownItems,
        selectedItem: provider.selectedMovingType,
        onChanged: (value) {
        provider.setMovingType(value);
        },
        val: (value) => provider.validateMovingType(value),
          controller: movingtypecontrooler,
        ),*/
            customDropdown(
              label: 'Moving Type (मूविंग के प्रकार)',
              items: QuotaionDetaildropdownItems,
              selectedItem: provider.selectedMovingType,
              controller: movingtypecontrooler, // ✅ will store selected value
              onChanged: (value) {
                provider.setMovingType(value);

                // ✅ also update controller so you can send later in formData
                movingtypecontrooler.text = value ?? '';
              },
              val: (value) => provider.validateMovingType(value),
            ),


            inputTextFields(
              label: 'Company Name Of Party (कंपनी नाम - जिसमें कोटेशन चाहिए)',
              textEditingController: provider.companyNameController,
            ),
            inputTextFields(
              label: 'Company GST NO. (कंपनी GST No.)',
              inputType: TextInputType.number,
              textEditingController: provider.companyGSTController,
            ),
            inputTextFields(
              label: 'Party name (व्यक्ति नाम - जिसे कोटेशन चाहिए)',
              textEditingController: provider.partyNameController,
            ),
            inputTextFields(
              label: 'Email (ईमेल)',
              inputType: TextInputType.emailAddress,
              textEditingController: provider.emailController,
            ),
            Row(
              children: [
                Expanded(
                  child: inputTextFields(
                    label: 'QT. Date (कोटेशन तिथि)',
                    textEditingController: provider.quotationDateController,
                    readOnly: true,
                    suffix: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(5101),
                        );
                        if (pickedDate != null) {
                          provider.quotationDateController.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: inputTextFields(
                    label: 'Packing date (पैकिंग तिथि)',
                    textEditingController: provider.packingDateController,
                    readOnly: true,
                    suffix: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(5101),
                        );
                        if (pickedDate != null) {
                          provider.packingDateController.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            inputTextFields(
              label: 'Shifting /Moving date (स्थानांतरण/मूविंग तिथि)',
              textEditingController: provider.shiftingDateController,
              readOnly: true,
              suffix: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(5101),
                  );
                  if (pickedDate != null) {
                    provider.shiftingDateController.text =
                    pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }



  Widget _buildMoveFromTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Move From (जहाँ से सामान जाएगा)',
            children: [
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.moveFromCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.moveFromStateController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'CITY (शहर)',
                textEditingController: provider.moveFromCityController,
              ),
              inputTextFields(
                label: 'PINCODE (पिनकोड)',
                textEditingController: provider.moveFromPincodeController,
                inputType: TextInputType.number,
                maxLength: 6,
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.moveFromAddressController,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Consumer<QuatationProvider>(
                      builder: (context, provider, child) {
                        return customDropdown(
                          label: 'FLOOR (मंजिल)',
                          items: floorOptions,
                          selectedItem: provider.selectedFromFloor,
                          onChanged: (value) {
                            provider.setFromFloor(value);
                          },
                          val: provider.validateDropdown,
                          controller: moveformfloorcontoller,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Consumer<QuatationProvider>(
                      builder: (context, provider, child) {
                        return customDropdown(
                          label: 'IS LIFT AVAILABLE (क्या लिफ्ट उपलब्ध है)',
                          items: liftOptions,
                          selectedItem: provider.selectedFromLiftAvailable,
                          onChanged: (value) {
                            provider.setFromLiftAvailable(value);
                          },
                          val: provider.validateDropdown,
                          controller: moveformliftcontoller,
                        );
                      },
                    ),
                  ),
                ],
              ),


            ],
          );
        }
    );
  }


  Widget _buildMoveToTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Move To (जहाँ सामान जाना है)',
            children: [
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.moveToCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.moveToStateController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'CITY (शहर)',
                textEditingController: provider.moveToCityController,
              ),
              inputTextFields(
                label: 'PINCODE (पिनकोड)',
                inputType: TextInputType.number,
                maxLength: 6,
                textEditingController: provider.moveToPincodeController,
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                textEditingController: provider.moveToAddressController,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Consumer<QuatationProvider>(
                      builder: (context, provider, child) {
                        return customDropdown(
                          label: 'FLOOR (मंजिल)',
                          items: floorOptions,
                          selectedItem: provider.selectedToFloor,
                          onChanged: (value) {
                            provider.setToFloor(value);
                          },
                          val: provider.validateDropdown, 
                          controller: movetocontroller,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Consumer<QuatationProvider>(
                      builder: (context, provider, child) {
                        return customDropdown(
                          label: 'IS LIFT AVAILABLE (क्या लिफ्ट उपलब्ध है)',
                          items: liftOptions,
                          selectedItem: provider.selectedToLiftAvailable,
                          onChanged: (value) {
                            provider.setToLiftAvailable(value);
                          },
                          val: provider.validateDropdown, 
                          controller: movetoliftcontoller,
                        );
                      },
                    ),
                  ),
                ],
              ),


            ],
          );
        }
    );
  }

  Widget _buildPaymentDetailsTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Payment Details(पेमेंट का विवरण)',
            children: [
              inputTextFields(
                label: 'FREIGHT CHARGE',
                hintText: '0',
                inputType: TextInputType.number,
                textEditingController: provider.freightChargeController,
              ),
              inputTextFields(
                label: 'ADVANCE PAID',
                hintText: '0',
                inputType: TextInputType.number,
                textEditingController: provider.advancePaidController,
              ),


              DropdownWithInputField(
              dropdownValue: provider.selectedPackingChargeOption,
          onDropdownChanged: (val) {
          provider.setPackingChargeOption(val);
          },
          dropdownItems: chargeOptions,
          controller: provider.packingChargeController,
          hintText: '0',
          labelText: 'PACKING CHARGE',
          ),

              DropdownWithInputField(
                dropdownValue: provider.unpackingChargeOption,
                onDropdownChanged: (val) {
                  provider.setUnpackingChargeOption(val!);
                },
                dropdownItems: chargeOptions,
                controller: provider.unpackingChargeController,
                hintText: '0',
                labelText: 'UNPACKING CHARGE',
              ),

              DropdownWithInputField(
                dropdownValue: provider.loadingChargeOption,
                onDropdownChanged: (val) {
                  provider.setLoadingChargeOption(val!);
                },
                dropdownItems: chargeOptions,
                controller: provider.loadingChargeController,
                hintText: '0',
                labelText: 'LOADING CHARGE',
              ),

              DropdownWithInputField(
                dropdownValue: provider.unloadingChargeOption,
                onDropdownChanged: (val) {
                  provider.setUnloadingChargeOption(val!);
                },
                dropdownItems: chargeOptions,
                controller: provider.unloadingChargeController,
                hintText: '0',
                labelText: 'UNLOADING CHARGE',
              ),

              DropdownWithInputField(
                dropdownValue: provider.packingMaterialChargeOption,
                onDropdownChanged: (val) {
                  provider.setPackingMaterialChargeOption(val!);
                },
                dropdownItems: chargeOptions,
                controller: provider.packingMaterialChargeController,
                hintText: '0',
                labelText: 'PACKING MATERIAL CHARGE',
              ),


              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'STORAGE CHARGE',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.storageChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'CAR/BIKE TPT',
                      inputType: TextInputType.number,
                      hintText: '0',
                      textEditingController: provider.carBikeTptController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'MISCELLANEOUS CHARGES',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.miscChargesController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'OTHER CHARGES',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.otherChargesController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'S.T. CHARGE',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.stChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'OCTRIO GREEN TAX',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.octrioTaxController,
                    ),
                  ),
                ],
              ),

              DropdownWithInputField2(
                dropdownValue: surchargeOption,
                dropdownValue2: surchargeOption2,

                onDropdownChanged: (val) {
                  setState(() {
                    surchargeOption = val;
                  });
                }, onDropdownChanged2: (val) {
                setState(() {
                  surchargeOption2 = val;
                });
              },
                dropdownItems: chargeOptions,
                dropdownItems2: chargeOptions2,
                 //controller: surchargeController,
                // hintText: '0',
                labelText: 'SURCHARGE',
              ),



              customDropdown(
                label: 'GST SHOW/HIDE GST',
                items: gstOptions,
                selectedItem: gstOption,
                onChanged: (value) {
                  setState(() {
                    gstOption = value;
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                }, 
                controller: gstshowingcontoller,
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customDropdown(
                      label: 'GST%',
                      items: ['0%', '5%', '12%', '18%', '28%'],
                      selectedItem: selectedGstPercent,
                      onChanged: (value) {
                        setState(() {
                          selectedGstPercent = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: gtspershowingcontolller,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: customDropdown(
                      label: 'GST TYPE',
                      items: ['CGST/SGST', 'CGST/UTGST', 'IGST'],
                      selectedItem: selectedGstType,
                      onChanged: (value) {
                        setState(() {
                          selectedGstType = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: gsttypecontroller,
                    ),
                  ),
                ],
              ),

              inputTextFields(
                label: 'REMARK (टिप्पड़ी)',
                textEditingController: provider.paymentRemarkController,
              ),
              inputTextFields(
                label: 'DISCOUNT(डिस्काउंट)-Applicable on Sub-Total Amount',

                textEditingController: provider.discountController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildInsuranceFOVTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Insurance (FOV) Details (बीमा की जानकारी)',
            children: [
              customDropdown(
                label: 'INSURANCE TYPE',
                items: [ 'Not Applicable','Optional','Show Insurance Amount','Included in Freight'],
                selectedItem: selectedInsuranceType,
                onChanged: (value) {
                  setState(() {
                    selectedInsuranceType = value;
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                }, controller:insurancetypecontroller,
              ),
              Row(
                crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENTAGE(%)',
                      items: ['1%', '2%', '3%', '4%', '5%'],
                      selectedItem: selectedInsuranceChargeValue,
                      onChanged: (value) {
                        setState(() {
                          selectedInsuranceChargeValue = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: insurancepergstController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: customDropdown(
                      label: 'GST%',
                      items: ['0', '1', '2', '3', '4', '5'],
                      selectedItem: selectedGstValue,
                      onChanged: (value) {
                        setState(() {
                          selectedGstValue = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: InsuranceFOVcontroller,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'DECLARATION VALUE OF VEHICLE(if any)',
                textEditingController: provider.declarationVehicleValueController,
              ),
            ],
          );

        }
    );
  }

  Widget _buildVehicleInsuranceTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Vehicle Insurance Details(वाहन बीमा विवरण)',
            children: [
              customDropdown(
                label: 'INSURANCE TYPE',
                items: ['Optional', 'Show Insurance Amount','Included in Freight','Extra','Insurance Mandatory'],
                selectedItem: selectedVehicleInsuranceType,
                onChanged: (value) {
                  setState(() {
                    selectedVehicleInsuranceType = value;
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                }, controller: vehicalinsurencecontoller,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENTAGE(%)',
                      items: ["0%", "0.25%", "0.75%","1%", "1.25%","1.5%","1.75%","2%","2.5%","3%","3.5%","4%","4.5%","5%", "5.5%","6%","6.5%","7%", "7.5%","8%","8.5%","9%","9.5%","10%"],
                      selectedItem: selectedVehicleInsuranceCharge,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleInsuranceCharge = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: insuranceChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: CustomDropdown(
                      controller: GSTperController,
                      label: 'GST%',
                      items: ['0', '5', '12', '18', '28'],
                      selectedItem: selectedVehicleInsuranceGst,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleInsuranceGst = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),
                 /* Expanded(
                    flex: 1,
                    child: customDropdown(
                      controller: stateController,
                      label: 'GST%',
                      items: ['0', '5', '12', '18', '28'],
                      selectedItem: selectedVehicleInsuranceGst,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleInsuranceGst = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),*/
                ],
              ),
              inputTextFields(
                label: 'DECLARATION VALUE OF VEHICLE(if any)',
                textEditingController: provider.vehicleDeclarationValueController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildOtherDetailsTile(){
    return Consumer<QuatationProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Other Details (अन्य विवरण)',
            children: [
              customDropdown(
                label: 'IS THERE ANY ACCESS FOR LOAD & UNLOAD AT ORIGIN & DESTINATION (क्या मूल और गंतव्य स्थान पर लोड और अनलोड के लिए कोई पहुंच है?)',
                items: ['Yes', 'No'],
                selectedItem: selectedAccessLoadUnload,
                onChanged: (value) {
                  setState(() {
                    selectedAccessLoadUnload = value;
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option (कृपया एक विकल्प चुनें)';
                  }
                  return null;
                }, controller: loadingunlodingcontroller,
              ),
              inputTextFields(
                label: 'SHOULD ANY ITEMS BE GOT DOWN THROUGH BALCONY ETC. (क्या कोई सामान बालकनी आदि के माध्यम से नीचे लाना है?)',
                hintText: 'Almirah, Bed, etc (अलमारी, बिस्तर, आदि)',
                textEditingController: gotDownItemsController,
              ),
              customDropdown(
                label: 'ARE THERE ANY RESTRICTIONS FOR LOADING/UNLOADING AT ORIGIN/DESTINATION (क्या मूल/गंतव्य स्थान पर लोडिंग/अनलोडिंग के लिए कोई प्रतिबंध है?)',
                items: ['Yes', 'No'],
                selectedItem: selectedLoadingRestrictions,
                onChanged: (value) {
                  setState(() {
                    selectedLoadingRestrictions = value;
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option (कृपया एक विकल्प चुनें)';
                  }
                  return null;
                }, controller: loadingunloadingorgincontroller,
              ),
              inputTextFields(
                label: 'DO YOU HAVE ANY SPECIAL NEEDS OR CONCERNS (क्या आपकी कोई विशेष आवश्यकताएं या चिंताएं हैं?)',
                textEditingController:  provider.specialNeedsController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildItemDetailsTile() {
    return _expansionTileWrapper(
      title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
      children: [
        Consumer<QuatationProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputTextFields(
                  label: 'ITEM / PARTICULAR NAME (आइटम / वस्तु का नाम)',
                  textEditingController: provider.itemNameController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: inputTextFields(
                        label: 'BOX NUMBER (बॉक्स संख्या)',
                        textEditingController: provider.itemBoxNumberController,
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                        label: 'QUANTITY (मात्रा)',
                        textEditingController: provider.itemQuantityController,
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                        label: 'VALUE (मूल्य)',
                        textEditingController: provider.itemValueController,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: inputTextFields(
                        label: 'CFT (घन फीट)',
                        textEditingController: provider.itemCFTController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: inputTextFields(
                        label: 'REMARK (टिप्पणी)',
                        textEditingController: provider.itemRemarkController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                  label: 'ADD ITEM / PARTICULAR',
                  buttonColor: const Color(0xFFFFBA00),
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    if (provider.itemNameController.text.isEmpty ||
                        provider.itemQuantityController.text.isEmpty ||
                        provider.itemValueController.text.isEmpty ||
                        provider.itemBoxNumberController.text.isEmpty ||
                        provider.itemCFTController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all required fields')),
                      );
                      return;
                    }

                    // Add item to provider list
                    provider.addItem(
                      itemName: provider.itemNameController.text,
                      boxNumber: provider.itemBoxNumberController.text,
                      quantity: provider.itemQuantityController.text,
                      value: provider.itemValueController.text,
                      cft: provider.itemCFTController.text,
                      remark: provider.itemRemarkController.text,
                    );

                    // Clear controllers
                    provider.itemNameController.clear();
                    provider.itemQuantityController.clear();
                    provider.itemValueController.clear();
                    provider.itemRemarkController.clear();
                    provider.itemBoxNumberController.clear();
                    provider.itemCFTController.clear();
                  },
                ),
                const SizedBox(height: 12),

                // Show list of added items
                ...provider.itemParticulars.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(
                        'Item: ${item["itemName"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item["quantity"]} | Value: ${item["value"]}'),
                          Text('Box: ${item["boxNumber"]} | CFT: ${item["cft"]}'),
                          if (item["remark"].toString().isNotEmpty)
                            Text('Remark: ${item["remark"]}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          provider.removeItem(index);
                        },
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ],
    );
  }

  /*Widget _buildItemDetailsTile() => _expansionTileWrapper(
    title: 'ITEM / PARTICULAR DETAILS(सामान का विवरण)',
    children: [
      ItemEntryListWidget(
        onItemListChanged: (items) {
          particularItemsDetails = items;

        },
      ),
    ],
  );*/

  Widget _expansionTileWrapper({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}



