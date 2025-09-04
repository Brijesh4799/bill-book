

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_checkBox.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_dropDownWithInputText.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/ProformaInvoice/provider/proformaProvider.dart';
import '../../../homeScreen/home_controller.dart';
import '../provider/proforma_pdf_provider.dart';

class ProformaInvoiceEditScreen extends StatefulWidget {
  final String id;
  //const ProformaInvoiceEditScreen({super.key});
  const ProformaInvoiceEditScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ProformaInvoiceEditScreen createState() => _ProformaInvoiceEditScreen();
}

class _ProformaInvoiceEditScreen extends State<ProformaInvoiceEditScreen> {
  //pre invoice detail

  final TextEditingController preInvoiceNumberController =
  TextEditingController(text: '0001');
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController lrNumberController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController deliveryDateController = TextEditingController();
  final TextEditingController movingPathController = TextEditingController();
  final TextEditingController shipmentTypeController = TextEditingController();
  final TextEditingController movingPathRemarkController =
  TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  // Text controllers for consignee details
  final TextEditingController consigneeNameController = TextEditingController();
  final TextEditingController consigneePhoneController =
  TextEditingController();
  final TextEditingController consigneeGstinController =
  TextEditingController();
  final TextEditingController consigneeCountryController =
  TextEditingController(text: 'India');
  final TextEditingController consigneeStateController =
  TextEditingController();
  final TextEditingController consigneeCityController = TextEditingController();
  final TextEditingController consigneePincodeController =
  TextEditingController();
  final TextEditingController consigneeAddressController =
  TextEditingController();

  // Charge option dropdowns
  String? packingChargeOption;
  String? unpackingChargeOption;
  String? loadingChargeOption;
  String? unloadingChargeOption;
  String? packingMaterialChargeOption;
  String? surchargeOption;
  String? gstOption;
  String? movingPath;
  String? gstPercentageOption;
  String? gstTypeOption;
  String? reverseChargeOption;
  String? gstPaidByOption;

  // Text controllers
  final TextEditingController freightChargeController = TextEditingController();
  final TextEditingController advancePaidController = TextEditingController();
  final TextEditingController packingChargeController = TextEditingController();
  final TextEditingController unpackingChargeController =
  TextEditingController();
  final TextEditingController loadingChargeController = TextEditingController();
  final TextEditingController unloadingChargeController =
  TextEditingController();
  final TextEditingController packingMaterialChargeController =
  TextEditingController();
  final TextEditingController storageChargeController = TextEditingController();
  final TextEditingController carBikeTptController = TextEditingController();
  final TextEditingController miscChargesController = TextEditingController();
  final TextEditingController otherChargesController = TextEditingController();
  final TextEditingController stChargeController = TextEditingController();
  final TextEditingController octrioTaxController = TextEditingController();
  final TextEditingController surchargeController = TextEditingController();
  final TextEditingController paymentRemarkController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  // Dropdown option lists
  final List<String> chargeOptions = [
    'Included in Freight',
    'Excluded',
    'Not Applicable',
  ];
  final List<String> surchargeOptions = ['Not Applicable', 'Applicable'];
  final List<String> gstShowHideOptions = [
    'GST Charge Show In Bill',
    'GST Charge Hide In Bill',
  ];
  final List<String> gstPercentageOptions = ['0', '5', '12', '18', '28'];
  final List<String> gstTypeOptions = ['CGST/SGST', 'IGST'];
  final List<String> reverseChargeOptions = ['NO', 'YES'];
  final List<String> gstPaidByOptions = ['Consignee', 'Consignor'];
  final List<String> movingPathOption = [
    'By Road',
    'By Sea',
    'By Air',
    'By Air & Road',
    'By Sea & Road',
    'On Location',
    'N/A'
  ];

  // Text controllers for billing details
  final TextEditingController billToNameController = TextEditingController();
  final TextEditingController billToPhoneController = TextEditingController();
  final TextEditingController billToGstinController = TextEditingController();
  final TextEditingController billToCountryController = TextEditingController(
    text: 'India',
  );
  final TextEditingController billToStateController = TextEditingController();
  final TextEditingController billToCityController = TextEditingController();
  final TextEditingController billToPincodeController = TextEditingController();
  final TextEditingController billToAddressController = TextEditingController();

  // Package Details Controllers
  final TextEditingController packageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController receiveConditionController =
  TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  // Dropdown variable for Package Details
  String? weightUnitOption;

  String? selectedInsuranceType;
  String? selectedInsuranceChargePercent;
  String? selectedGstValue;
  final TextEditingController declarationGoodsValueController = TextEditingController();

  String? selectedVehicleInsuranceType;
  String? selectedVehicleInsuranceChargePercent;
  String? selectedVehicleGstValue;
  final TextEditingController declarationVehicleValueController = TextEditingController();

  // Consignor Details Controllers
  final TextEditingController consignorNameController = TextEditingController();
  final TextEditingController consignorPhoneController = TextEditingController();
  final TextEditingController consignorGstinController = TextEditingController();
  final TextEditingController consignorCountryController = TextEditingController();
  final TextEditingController consignorStateController = TextEditingController();
  final TextEditingController consignorCityController = TextEditingController();
  final TextEditingController consignorPincodeController = TextEditingController();
  final TextEditingController consignorAddressController = TextEditingController();

// Checkbox state for "Same as Billing"
  bool isConsignorSameAsBilling = true;

 // @override
  /*void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProformaPdfProvider>(context, listen: false);
      provider.getproformaById(id: widget.id);
    });
  }*/
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final proformaProvider =
      Provider.of<ProformaPdfProvider>(context, listen: false);
      proformaProvider.getProformaById(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Proforma invoice'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPreInvoiceDetails(),
              _buildBillingDetailsTile(),
              _buildConsignorDetailsTile(),
              _buildConsigneeDetailsTile(),
              _buildPackageDetailsTile(),
              _buildPaymentDetailsTile(),
              _buildInsuranceDetailsTile(),
              _buildVehicleInsuranceDetailsTile(),
              const SizedBox(height: 80),
            ],
          ),
        ),


        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<ProformaPdfProvider>(
              builder: (context, proformaProvider, child) {
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

                    String userId = widget.id;
                    if (userId.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User ID not found')),
                      );
                      return;
                    }

                    Map<String, dynamic> updateData = {
                      "formData": {
                        "preInvoiceDetails": {
                          "preInvoiceNumber": preInvoiceNumberController.text.trim(),
                          "preCompanyName": companyNameController.text.trim(),
                          "preInvoiceDate": invoiceDateController.text.trim(),
                          "preDeliveryDate": deliveryDateController.text.trim(),
                          "shipment": shipmentTypeController.text.trim(),
                          "movingPathRemark": movingPathRemarkController.text.trim(),
                          "moveFrom": moveFromController.text.trim(),
                         // "moveto": moveToControllerr.text.trim(),
                          "vehicleNumber": vehicleNumberController.text.trim(),
                        },
                        "billingDetails": {
                          "customerName": billToNameController.text.trim(),
                          "customerPhone": billToPhoneController.text.trim(),
                          "customerGstNumber": billToGstinController.text.trim(),
                          "customerCountry": billToCountryController.text.trim(),
                          "customerstate": billToStateController.text.trim(),
                          "customercity": billToCityController.text.trim(),
                          "customerpincode": billToPincodeController.text.trim(),
                          "customeraddress": billToAddressController.text.trim(),
                        },
                        "consignorDetails": {
                          "consignorName": consignorNameController.text.trim(),
                          "consignorPhone": consignorPhoneController.text.trim(),
                          "consignorgstNo": consignorGstinController.text.trim(),
                          "consignorcountry": consignorCountryController.text.trim(),
                          "consignorstate": consignorStateController.text.trim(),
                          "consignorcity": consignorCityController.text.trim(),
                          "consignorpincode": consignorPincodeController.text.trim(),
                          "consignoraddress": consignorAddressController.text.trim(),
                        },
                        "consigneeDetails": {
                          "consigneeName": consigneeNameController.text.trim(),
                          "consigneePhone": consigneePhoneController.text.trim(),
                          "consigneegstNo": consigneeGstinController.text.trim(),
                          "consigneeCountry": consigneeCountryController.text.trim(),
                          "consigneestate": consigneeStateController.text.trim(),
                          "consigneecity": consigneeCityController.text.trim(),
                          "consigneepincode": consigneePincodeController.text.trim(),
                          "consigneeaddress": consigneeAddressController.text.trim(),
                        },
                        "packageDetails": {
                          "packageType": packageController.text.trim(),
                          "description": descriptionController.text.trim(),
                          "hsnCode": receiveConditionController.text.trim(),
                          "detailsremark": remarkController.text.trim(),
                        },
                        "paymentDetails": {
                          "freightCharge": freightChargeController.text.trim(),
                          "advancePaid": advancePaidController.text.trim(),
                          "packingCharge": packingChargeController.text.trim(),
                          "unPackedCharge": unpackingChargeController.text.trim(),
                          "loadingCharges": loadingChargeController.text.trim(),
                          "unloadingCharges": unloadingChargeController.text.trim(),
                          "packingMaterialCharge": packingMaterialChargeController.text.trim(),
                          "storgeCharge": storageChargeController.text.trim(),
                          "carBikeTPT": carBikeTptController.text.trim(),
                          "miscellaneousCharge": miscChargesController.text.trim(),
                          "otherCharges": otherChargesController.text.trim(),
                          "stCharge": stChargeController.text.trim(),
                          "greenTax": octrioTaxController.text.trim(),
                          "surcharge": surchargeController.text.trim(),
                          "paymentRemark": paymentRemarkController.text.trim(),
                          "paymentDiscount": discountController.text.trim(),
                        },
                        "insuranceDetails": {
                          "insuranceCharges": declarationVehicleValueController.text.trim(),
                          "declarationValueOfGoods": declarationGoodsValueController.text.trim(),
                        },
                        "vehicleInsuranceDetails": {
                          "vehicleNumber": vehicleNumberController.text.trim(),
                        },
                      }
                    };

                    var proformaData =
                    await proformaProvider.fetchProformaById(userId, updateData);

                    if (proformaData == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(' update proforma data')),
                      );
                      return;
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit Proforma',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        ),

    );
  }

  Widget _buildPreInvoiceDetails(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Pre. Invoice Details (प्रोफार्मा बिल का विवरण)',
            children: [
              inputTextFields(
                inputType: TextInputType.number,
                label: 'PRE. INVOICE NUMBER* (बिल नंबर)',
                textEditingController: provider.preInvoiceNumberController,
              ),
              inputTextFields(
                label: 'COMPANY NAME OF PARTY (कंपनी नाम - जिसे कोटेशन चाहिए)',
                textEditingController: provider.companyNameController,
              ),
              // inputTextFields(
              //   label: 'LR NUMBER (बिल्टी नंबर)',
              //   textEditingController: lrNumberController,
              // ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'INVOICE DATE (बिल की तारीख)',
                      textEditingController: provider.invoiceDateController,
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
                            setState(() {
                              provider.invoiceDateController.text =
                              pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'DELIVERY DATE (सामान मिलने की तारीख)',
                      textEditingController: provider.deliveryDateController,
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
                            setState(() {
                              provider.deliveryDateController.text =
                              pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'GST SHOW/HIDE GST',
                      items: movingPathOption,
                      selectedItem: movingPath,
                      onChanged: (value) {
                        setState(() {
                          movingPath = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'TYPE OF SHIPMENT (शिपमेंट का प्रकार)',
                      textEditingController: provider.shipmentTypeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVING PATH REMARK (मूविंग रास्ता टिप्पणी)',
                textEditingController: provider.movingPathRemarkController,
              ),
              inputTextFields(
                label: 'MOVE FROM (जहां से सामान जाएगा)',
                textEditingController: provider.moveFromController,
              ),
              inputTextFields(
                label: 'MOVE TO (जहां सामान जाना है)',
                textEditingController: provider.moveToControllerr,
              ),
              inputTextFields(
                label: 'VEHICLE NUMBER (गाड़ी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.vehicleNumberController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildBillingDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Billing Details (बिल प्राप्तकर्ता का विवरण)',
            children: [
              inputTextFields(
                label: 'BILL TO NAME* (बिल प्राप्तकर्ता का नाम)',
                textEditingController: provider.billToNameController,
              ),
              inputTextFields(
                label: 'BILL TO PHONE* (बिल प्राप्तकर्ता का फोन)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.billToPhoneController,
              ),
              inputTextFields(
                label: 'GSTIN (जीएसटी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.billToGstinController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.billToCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.billToStateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.billToCityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिन कोड)',
                      inputType: TextInputType.number,
                      maxLength: 6,
                      textEditingController: provider.billToPincodeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.billToAddressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildConsignorDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return    _expansionTileWrapper(
            title: 'Consignor Details (समान भेजने वाले का विवरण)',
            children: [
              customCheckbox(
                isChecked: isConsignorSameAsBilling,
                label: "CONSIGNOR DETAILS SAME AS BILLING DETAILS",
                labelColor: Colors.green,
                onChanged: (bool? value) {
                  setState(() {
                    isConsignorSameAsBilling = value ?? false;
                  });
                },
              ),

              if (!isConsignorSameAsBilling) ...[
                inputTextFields(
                    label: 'CONSIGNOR NAME (भेजने वाले का नाम)',
                    textEditingController: provider.consignorNameController
                ),
                inputTextFields(
                    label: 'CONSIGNOR PHONE* (भेजने वाले का फोन)',
                    inputType: TextInputType.phone,
                    maxLength: 10,
                    textEditingController: provider.consignorPhoneController
                ),
                inputTextFields(
                    label: 'GSTIN (जीएसटी नंबर)',
                    inputType: TextInputType.number,
                    textEditingController: provider.consignorGstinController
                ),
                Row(
                  children: [
                    Expanded(child: inputTextFields(
                        label: 'COUNTRY (देश)',
                        textEditingController: provider.consignorCountryController)),
                    SizedBox(width: 10),
                    Expanded(child: inputTextFields(label: 'STATE (राज्य)', textEditingController: provider.consignorStateController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: inputTextFields(label: 'CITY (शहर)', textEditingController: provider.consignorCityController)),
                    SizedBox(width: 10),
                    Expanded(child: inputTextFields(
                        label: 'PINCODE (पिन कोड)',
                        inputType: TextInputType.number,
                        maxLength: 6,
                        textEditingController: provider.consignorPincodeController
                    )),
                  ],
                ),
                inputTextFields(
                  label: 'ADDRESS (पता)',
                  maxLines: 4,
                  textEditingController: provider.consignorAddressController,
                ),
              ],
            ],
          );
        }
    );
  }

  Widget _buildConsigneeDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Consignee Details (सामान लेने वाले का विवरण)',
            children: [
              inputTextFields(
                label: 'CONSIGNEE NAME (सामान लेने वाले का नाम)',
                textEditingController: provider.consigneeNameController,
              ),
              inputTextFields(
                inputType: TextInputType.phone,
                maxLength: 10,
                label: 'CONSIGNEE PHONE (सामान लेने वाले का फोन)',
                textEditingController: provider.consigneePhoneController,
              ),
              inputTextFields(
                label: 'GSTIN (जीएसटी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.consigneeGstinController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.consigneeCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.consigneeStateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.consigneeCityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिन कोड)',
                      inputType: TextInputType.number,
                      maxLength: 6,
                      textEditingController: provider.consigneePincodeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.consigneeAddressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildPackageDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Package Details (पैकेज का विवरण)',
            children: [
              inputTextFields(
                label: 'PACKAGE (पैकेज)',
                textEditingController: provider.packageController,
              ),
              inputTextFields(
                label: 'DESCRIPTION (पैकेज का विवरण)',
                textEditingController: provider.descriptionController,
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.totalWeightUnit,
                    onDropdownChanged: (val) {
                      provider.setTotalWeightUnit(val);
                    },
                    dropdownItems: ['KG', 'Ton', 'Gram'],
                    controller: provider.totalWeightController,
                    hintText: 'Enter Value',
                    dropDownhint: 'Select Unit',
                    labelText: 'TOTAL WEIGHT (कुल वजन)',
                  );
                },
              ),


              inputTextFields(
                label: 'HSN/SAC CODE',
                textEditingController: provider.receiveConditionController,
              ),
              inputTextFields(
                label: 'REMARK (अन्य विवरण)',
                maxLines: 3,
                textEditingController: provider.remarkController,
              ),
            ],
          );

        }
    );
  }

  Widget _buildPaymentDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Payment Details (पेमेंट का विवरण)',
            children: [
              inputTextFields(
                label: 'FREIGHT CHARGE',
                hintText: '0',
                inputType: TextInputType.number,
                textEditingController: provider.freightChargeController,
              ),
              inputTextFields(
                label: 'ADVANCE PAID',
                inputType: TextInputType.number,
                hintText: '0',
                textEditingController: provider.advancePaidController,
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.packingChargeOption,
                    onDropdownChanged: (val) {
                      provider.setPackingChargeOption(val);
                    },
                    dropdownItems: chargeOptions,
                    controller: provider.packingChargeController,
                    hintText: '0',
                    labelText: 'PACKING CHARGE',
                  );
                },
              ),



              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.unpackingChargeOption,
                    onDropdownChanged: (val) {
                      provider.setUnpackingChargeOption(val);
                    },
                    dropdownItems: chargeOptions,
                    controller: provider.unpackingChargeController,
                    hintText: '0',
                    labelText: 'UN PACKING CHARGE',
                  );
                },
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.loadingChargeOption,
                    onDropdownChanged: (val) {
                      provider.setLoadingChargeOption(val);
                    },
                    dropdownItems: chargeOptions,
                    controller: provider.loadingChargeController,
                    hintText: '0',
                    labelText: 'LOADING CHARGE',
                  );
                },
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.unloadingChargeOption,
                    onDropdownChanged: (val) {
                      provider.setUnloadingChargeOption(val);
                    },
                    dropdownItems: chargeOptions,
                    controller: provider.unloadingChargeController,
                    hintText: '0',
                    labelText: 'UN LOADING CHARGE',
                  );
                },
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.packingMaterialChargeOption,
                    onDropdownChanged: (val) {
                      provider.setPackingMaterialChargeOption(val);
                    },
                    dropdownItems: chargeOptions,
                    controller: provider.packingMaterialChargeController,
                    hintText: '0',
                    labelText: 'PACKING MATERIAL CHARGE',
                  );
                },
              ),


              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'STORAGE CHARGE',
                      hintText: '0',
                      textEditingController: provider.storageChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'CAR/BIKE TPT',
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
                      textEditingController: provider.miscChargesController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'OTHER CHARGES',
                      hintText: '0',
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
                      textEditingController: provider.stChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'GREEN TAX',
                      hintText: '0',
                      textEditingController: provider.octrioTaxController,
                    ),
                  ),
                ],
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.surchargeOption,
                    onDropdownChanged: (val) {
                      provider.setSurchargeOption(val);
                    },
                    dropdownItems: surchargeOptions,
                    controller: provider.surchargeController,
                    hintText: '10%',
                    labelText: 'SURCHARGE',
                  );
                },
              ),

              Consumer<ProformaInvoiceProvider>(
                builder: (context, provider, child) {
                  return customDropdown(
                    label: 'GST SHOW/HIDE GST',
                    items: gstShowHideOptions,
                    selectedItem: provider.gstOption,
                    onChanged: (value) {
                      provider.setGstOption(value);
                    },
                    val: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    }, controller: null,
                  );
                },
              ),

              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'GST %',
                      items: gstPercentageOptions,
                      selectedItem: gstPercentageOption,
                      onChanged: (value) {
                        setState(() {
                          gstPercentageOption = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select GST %';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: customDropdown(
                      label: 'GST TYPE',
                      items: gstTypeOptions,
                      selectedItem: gstTypeOption,
                      onChanged: (value) {
                        setState(() {
                          gstTypeOption = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select GST Type';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'REVERSE CHARGE',
                      items: reverseChargeOptions,
                      selectedItem: reverseChargeOption,
                      onChanged: (value) {
                        setState(() {
                          reverseChargeOption = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select Reverse Charge option';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: customDropdown(
                      label: 'GST PAID BY',
                      items: gstPaidByOptions,
                      selectedItem: gstPaidByOption,
                      onChanged: (value) {
                        setState(() {
                          gstPaidByOption = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select who pays GST';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'PAYMENT REMARK',
                textEditingController: provider.paymentRemarkController,
              ),
              inputTextFields(
                label: 'DISCOUNT (डिस्काउंट) - APPLICABLE ON SUB-TOTAL AMOUNT',
                textEditingController: provider.discountController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildInsuranceDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Insurance Details (इंश्योरेंस जानकारी)',
            children: [
              customDropdown(
                label: 'Insurance Type',
                items: ['Yes', 'Not Applicable'],
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
                }, controller: null,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENT(%)',
                      items: ['Yes', 'No'],
                      selectedItem: selectedInsuranceChargePercent,
                      onChanged: (value) {
                        setState(() {
                          selectedInsuranceChargePercent = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: null,
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
                      }, controller: null,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'DECLARATION VALUE OF GOODS(if any)',
                textEditingController: provider.declarationGoodsValueController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildVehicleInsuranceDetailsTile(){
    return Consumer<ProformaPdfProvider>(
        builder: (context, provider, child){
          return   _expansionTileWrapper(
            title: 'Vehicle insurance Details (गाड़ी इंश्योरेंस जानकारी)',
            children: [
              customDropdown(
                label: 'Insurance Type',
                items: ['Yes', 'Not Applicable'],
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
                }, controller: null,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENT(%)',
                      items: ['Yes', 'No'],
                      selectedItem: selectedVehicleInsuranceChargePercent,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleInsuranceChargePercent = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: customDropdown(
                      label: 'GST%',
                      items: ['0', '1', '2', '3', '4', '5'],
                      selectedItem: selectedVehicleGstValue,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleGstValue = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: null,
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
