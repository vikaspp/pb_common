class ApiEndPoints {
  ApiEndPoints._();

  static String signIn = "auth/jwt/create/";
  static String signUp = "/users/register/";

  static String base = "farmers/api/v1/";

  static String userList = "users/list/";
  static String farmerList = "${base}farmer/";
  static String stateList = "${base}state/";
  static String districtList = "${base}district/";
  static String talukaList = "${base}talukamandal/";
  static String villageList = "${base}village/";
  static String categoryList = "${base}category/";
  static String pincodeList = "${base}pincode/";
  static String clusterList = "${base}master_table_cluster/";

  static String indentData = "indents/process_indent_dashboard";

  static String profileDetail = "/users/list/";
  static String addEmail = "api/users/email/";
  static String deleteEmail = "api/users/email/delete/";
}
