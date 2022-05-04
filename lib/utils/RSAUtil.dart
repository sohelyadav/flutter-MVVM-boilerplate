
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stacked_services/stacked_services.dart';

// class RSAUtil {

// final int bufferSize_ = 32;

//     // String getKey(String filename){
//     //     String strKeyPEM = "";
//     //     Reader? keyFileReader;
//     //     try {
//     //         keyFileReader = new FileReader(filename);
//     //     } catch (FileNotFoundException e) {
//     //         InputStream resourceAsStream = RSAUtil.class.getClassLoader().getResourceAsStream(filename);
//     //         keyFileReader = new InputStreamReader(resourceAsStream);
//     //     }

//     //     BufferedReader br = new BufferedReader(keyFileReader);
//     //     String line;
//     //     while ((line = br.readLine()) != null) {
//     //         strKeyPEM += line + "\n";
//     //     }
//     //     br.close();
//     //     return strKeyPEM;
//     // }


//     getPublicKey(String filename)  {
//         String? publicKeyPEM;
//         try {
//             publicKeyPEM = getKeyFromFile(StackedService.navigatorKey?.currentContext, filename);
//         } catch (e) {
//             log("RSAUtil getPublicKey error : $e");
//         }
//         return getPublicKeyFromString(publicKeyPEM!);
//     }

//     getPublicKeyFromString(String key){
//         String publicKeyPEM = key;
//         publicKeyPEM = publicKeyPEM.replaceAll("-----BEGIN PUBLIC KEY-----\r\n", "");
//         publicKeyPEM = publicKeyPEM.replaceAll("\r\n-----END PUBLIC KEY-----\r\n", "");
//         Uint8List encoded = base64.decode(publicKeyPEM);
//         KeyFactory kf = KeyFactory.getInstance("RSA");
//         RSAPublicKey pubKey = (RSAPublicKey) kf.generatePublic(new X509EncodedKeySpec(encoded));
//         return pubKey;
//     }

//     bool verify(PublicKey publicKey, String message, String signature){
//         Signature sign = Signature.getInstance("SHA256withRSA");
//         sign.initVerify(publicKey);
//         sign.update(message.getBytes("UTF-8"));
//         byte[] decodeBase64 = Base64.decodeBase64(signature.getBytes("UTF-8"));
//         return sign.verify(decodeBase64);
//     }


//     String getKeyFromFile(BuildContext ctx, String fileName) {
//         InputStream input = ctx.getAssets().open(fileName);
//         byte[] buffer = new byte[bufferSize_];
//         int len = 0;
//         ByteArrayOutputStream keyBuffer = new ByteArrayOutputStream();
//         while ((len = input.read(buffer)) != -1) {
//             keyBuffer.write(buffer, 0, len);
//         }

//         String str = new String(keyBuffer.toByteArray());
//         return str;
//     }

// }

