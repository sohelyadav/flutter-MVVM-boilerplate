import 'dart:core';

class ValidateGstin {
  bool validateGstinNumber(String value) {
    RegExp normal = new RegExp(
        "^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[Zz1-9A-Ja-j]{1}[0-9a-zA-Z]{1}\$",
        multiLine: true);
    RegExp unbody = new RegExp(
        "^[0-9]{4}[A-Z]{3}[0-9]{5}[UO]{1}[N][A-Z0-9]{1}\$",
        multiLine: true);
    RegExp govBody = new RegExp(
        "^[0-9]{2}[a-zA-Z]{4}[0-9]{5}[a-zA-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}\$",
        multiLine: true);
    RegExp nriId = new RegExp(
        "^[0-9]{4}[a-zA-Z]{3}[0-9]{5}[N][R][0-9a-zA-Z]{1}\$",
        multiLine: true);
    RegExp tds = new RegExp(
        "^[0-9]{2}[a-zA-Z]{4}[a-zA-Z0-9]{1}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[D]{1}[0-9a-zA-Z]{1}\$",
        multiLine: true);
    RegExp tcs = new RegExp(
        "^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[C]{1}[0-9a-zA-Z]{1}\$",
        multiLine: true);
    RegExp oidar = new RegExp(
        "^[9][9][0-9]{2}[a-zA-Z]{3}[0-9]{5}[O][S][0-9a-zA-Z]{1}\$",
        multiLine: true);

    if (normal.hasMatch(value))
      return true;
    else if (unbody.hasMatch(value))
      return true;
    else if (govBody.hasMatch(value))
      return true;
    else if (nriId.hasMatch(value))
      return true;
    else if (tds.hasMatch(value))
      return true;
    else if (tcs.hasMatch(value))
      return true;
    else if (oidar.hasMatch(value))
      return true;
    else
      return false;
  }
}



//     companion object {
//         private val normal =
//             Pattern.compile("^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[Zz1-9A-Ja-j]{1}[0-9a-zA-Z]{1}$")
//         private val UNBODY =
//             Pattern.compile("^[0-9]{4}[A-Z]{3}[0-9]{5}[UO]{1}[N][A-Z0-9]{1}$")
//         private val GOVT_DEPTID =
//             Pattern.compile("^[0-9]{2}[a-zA-Z]{4}[0-9]{5}[a-zA-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}$")
//         private val NRI_ID =
//             Pattern.compile("^[0-9]{4}[a-zA-Z]{3}[0-9]{5}[N][R][0-9a-zA-Z]{1}$")
//         private val TDS =
//             Pattern.compile("^[0-9]{2}[a-zA-Z]{4}[a-zA-Z0-9]{1}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[D]{1}[0-9a-zA-Z]{1}$")
//         private val TCS =
//             Pattern.compile("^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[C]{1}[0-9a-zA-Z]{1}$")
//         private val OIDAR =
//             Pattern.compile("^[9][9][0-9]{2}[a-zA-Z]{3}[0-9]{5}[O][S][0-9a-zA-Z]{1}$")

//         fun validateGstin(gstin: String): Boolean {
//             return when {
//                 normal.matcher(gstin).matches() -> true
//                 UNBODY.matcher(gstin)
//                     .matches() -> true
//                 GOVT_DEPTID.matcher(gstin)
//                     .matches() -> true
//                 NRI_ID.matcher(gstin).matches() -> true
//                 TDS.matcher(
//                     gstin
//                 ).matches() -> true
//                 TCS.matcher(gstin).matches() -> true
//                 OIDAR.matcher(
//                     gstin
//                 ).matches() -> true
//                 else -> false
//             }
//         }
//     }
// }