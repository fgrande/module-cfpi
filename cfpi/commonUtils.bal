import ballerina/io;
import ballerina/encoding;

// commonUtils Class

function cfChecksum(string pCF) returns string
{
  // ASCII     : 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90
  // Char      :  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  A,  B,  C,  D,  E,  F,  G,  H,  I,  J,  K,  L,  M,  N,  O,  P,  Q,  R,  S,  T,  U,  V,  W,  X,  Y,  Z
  byte[] even = [ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  0,  0,  0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
  byte[] odds = [ 1,  0,  5,  7,  9, 13, 15, 17, 19, 21,  0,  0,  0,  0,  0,  0,  0,  1,  0,  5,  7,  9, 13, 15, 17, 19, 21,  2,  4, 18, 20, 11,  3,  6,  8, 12, 14, 16, 10, 22, 25, 24, 23];
  string checksums = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  string _checksum = "";

  byte[] cfBytes = pCF.toByteArray("UTF-8");
  int cfLength = cfBytes.length() - 1;

  int i = 0;
  int chkTot = 0;

  while (i < cfLength)
  {
    int idx = cfBytes[i] - 48;

    if (i % 2 == 0) {
      chkTot = chkTot + odds[idx];
    }
    else {
      chkTot = chkTot + even[idx];
    }

    i = i + 1;
  }

  chkTot = (chkTot % 26);

  _checksum = checksums.substring(chkTot, chkTot + 1);

  return _checksum;
}


function piChecksum(string pVAT) returns string
{
  string _checksum = "";

  byte[] piBytes = pVAT.toByteArray("UTF-8");
  int piLength = piBytes.length() - 1;

  int i = 0;
  int chkTot = 0;

  while (i < piLength)
  {
    int tNum = int.convert(piBytes[i]) - 48;

    if (i % 2 == 0) {
      chkTot = chkTot + tNum;
    }
    else {
      tNum = tNum * 2;
      chkTot = chkTot + tNum - (tNum > 9 ? 9 : 0);
    }
 
    i = i + 1;
  }

  int tmpCheck = chkTot % 10;
  tmpCheck = (10 - tmpCheck) % 10;

  _checksum = string.convert(tmpCheck);

  return _checksum;
}
