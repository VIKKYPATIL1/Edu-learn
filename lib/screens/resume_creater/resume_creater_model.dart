import '/flutter_flow/flutter_flow_util.dart';
import 'resume_creater_widget.dart' show ResumeCreaterWidget;
import 'package:flutter/material.dart';

class ResumeCreaterModel extends FlutterFlowModel<ResumeCreaterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipTextController;
  String? Function(BuildContext, String?)? zipTextControllerValidator;
  // State field(s) for LinkedIn widget.
  FocusNode? linkedInFocusNode;
  TextEditingController? linkedInTextController;
  String? Function(BuildContext, String?)? linkedInTextControllerValidator;
  // State field(s) for Degree widget.
  FocusNode? degreeFocusNode;
  TextEditingController? degreeTextController;
  String? Function(BuildContext, String?)? degreeTextControllerValidator;
  // State field(s) for GraduationYear widget.
  FocusNode? graduationYearFocusNode;
  TextEditingController? graduationYearTextController;
  String? Function(BuildContext, String?)?
      graduationYearTextControllerValidator;
  // State field(s) for GPA widget.
  FocusNode? gpaFocusNode;
  TextEditingController? gpaTextController;
  String? Function(BuildContext, String?)? gpaTextControllerValidator;
  // State field(s) for CollegeName widget.
  FocusNode? collegeNameFocusNode;
  TextEditingController? collegeNameTextController;
  String? Function(BuildContext, String?)? collegeNameTextControllerValidator;
  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for Summary widget.
  FocusNode? summaryFocusNode;
  TextEditingController? summaryTextController;
  String? Function(BuildContext, String?)? summaryTextControllerValidator;
  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for JobTitle widget.
  FocusNode? jobTitleFocusNode;
  TextEditingController? jobTitleTextController;
  String? Function(BuildContext, String?)? jobTitleTextControllerValidator;
  // State field(s) for LocationC widget.
  FocusNode? locationCFocusNode;
  TextEditingController? locationCTextController;
  String? Function(BuildContext, String?)? locationCTextControllerValidator;
  // State field(s) for sdate widget.
  FocusNode? sdateFocusNode;
  TextEditingController? sdateTextController;
  String? Function(BuildContext, String?)? sdateTextControllerValidator;
  // State field(s) for edate widget.
  FocusNode? edateFocusNode;
  TextEditingController? edateTextController;
  String? Function(BuildContext, String?)? edateTextControllerValidator;
  // State field(s) for Responsibility1 widget.
  FocusNode? responsibility1FocusNode;
  TextEditingController? responsibility1TextController;
  String? Function(BuildContext, String?)?
      responsibility1TextControllerValidator;
  // State field(s) for Responsibility2 widget.
  FocusNode? responsibility2FocusNode;
  TextEditingController? responsibility2TextController;
  String? Function(BuildContext, String?)?
      responsibility2TextControllerValidator;
  // State field(s) for Responsibility3 widget.
  FocusNode? responsibility3FocusNode;
  TextEditingController? responsibility3TextController;
  String? Function(BuildContext, String?)?
      responsibility3TextControllerValidator;
  // State field(s) for t1 widget.
  FocusNode? t1FocusNode;
  TextEditingController? t1TextController;
  String? Function(BuildContext, String?)? t1TextControllerValidator;
  // State field(s) for l1 widget.
  FocusNode? l1FocusNode;
  TextEditingController? l1TextController;
  String? Function(BuildContext, String?)? l1TextControllerValidator;
  // State field(s) for tn1 widget.
  FocusNode? tn1FocusNode;
  TextEditingController? tn1TextController;
  String? Function(BuildContext, String?)? tn1TextControllerValidator;
  // State field(s) for t2 widget.
  FocusNode? t2FocusNode;
  TextEditingController? t2TextController;
  String? Function(BuildContext, String?)? t2TextControllerValidator;
  // State field(s) for l2 widget.
  FocusNode? l2FocusNode;
  TextEditingController? l2TextController;
  String? Function(BuildContext, String?)? l2TextControllerValidator;
  // State field(s) for tn2 widget.
  FocusNode? tn2FocusNode;
  TextEditingController? tn2TextController;
  String? Function(BuildContext, String?)? tn2TextControllerValidator;
  // State field(s) for s1 widget.
  FocusNode? s1FocusNode;
  TextEditingController? s1TextController;
  String? Function(BuildContext, String?)? s1TextControllerValidator;
  // State field(s) for s2 widget.
  FocusNode? s2FocusNode;
  TextEditingController? s2TextController;
  String? Function(BuildContext, String?)? s2TextControllerValidator;
  // State field(s) for s3 widget.
  FocusNode? s3FocusNode;
  TextEditingController? s3TextController;
  String? Function(BuildContext, String?)? s3TextControllerValidator;
  // State field(s) for s4 widget.
  FocusNode? s4FocusNode;
  TextEditingController? s4TextController;
  String? Function(BuildContext, String?)? s4TextControllerValidator;
  // State field(s) for s5 widget.
  FocusNode? s5FocusNode;
  TextEditingController? s5TextController;
  String? Function(BuildContext, String?)? s5TextControllerValidator;
  // State field(s) for RC widget.
  FocusNode? rcFocusNode;
  TextEditingController? rcTextController;
  String? Function(BuildContext, String?)? rcTextControllerValidator;
  // State field(s) for AA widget.
  FocusNode? aaFocusNode;
  TextEditingController? aaTextController;
  String? Function(BuildContext, String?)? aaTextControllerValidator;
  // State field(s) for SP widget.
  FocusNode? spFocusNode;
  TextEditingController? spTextController;
  String? Function(BuildContext, String?)? spTextControllerValidator;
  // State field(s) for EA widget.
  FocusNode? eaFocusNode;
  TextEditingController? eaTextController;
  String? Function(BuildContext, String?)? eaTextControllerValidator;
  // Stores action output result for [Custom Action - generateDocument] action in CreateResume widget.
  String? responseofdownload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    zipFocusNode?.dispose();
    zipTextController?.dispose();

    linkedInFocusNode?.dispose();
    linkedInTextController?.dispose();

    degreeFocusNode?.dispose();
    degreeTextController?.dispose();

    graduationYearFocusNode?.dispose();
    graduationYearTextController?.dispose();

    gpaFocusNode?.dispose();
    gpaTextController?.dispose();

    collegeNameFocusNode?.dispose();
    collegeNameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    summaryFocusNode?.dispose();
    summaryTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    jobTitleFocusNode?.dispose();
    jobTitleTextController?.dispose();

    locationCFocusNode?.dispose();
    locationCTextController?.dispose();

    sdateFocusNode?.dispose();
    sdateTextController?.dispose();

    edateFocusNode?.dispose();
    edateTextController?.dispose();

    responsibility1FocusNode?.dispose();
    responsibility1TextController?.dispose();

    responsibility2FocusNode?.dispose();
    responsibility2TextController?.dispose();

    responsibility3FocusNode?.dispose();
    responsibility3TextController?.dispose();

    t1FocusNode?.dispose();
    t1TextController?.dispose();

    l1FocusNode?.dispose();
    l1TextController?.dispose();

    tn1FocusNode?.dispose();
    tn1TextController?.dispose();

    t2FocusNode?.dispose();
    t2TextController?.dispose();

    l2FocusNode?.dispose();
    l2TextController?.dispose();

    tn2FocusNode?.dispose();
    tn2TextController?.dispose();

    s1FocusNode?.dispose();
    s1TextController?.dispose();

    s2FocusNode?.dispose();
    s2TextController?.dispose();

    s3FocusNode?.dispose();
    s3TextController?.dispose();

    s4FocusNode?.dispose();
    s4TextController?.dispose();

    s5FocusNode?.dispose();
    s5TextController?.dispose();

    rcFocusNode?.dispose();
    rcTextController?.dispose();

    aaFocusNode?.dispose();
    aaTextController?.dispose();

    spFocusNode?.dispose();
    spTextController?.dispose();

    eaFocusNode?.dispose();
    eaTextController?.dispose();
  }
}
