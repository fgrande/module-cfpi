import ballerina/io;
// cfUtils Class

# Fiscal Code utilities class
public type piUtils object {
   
    public function __init()
    {
    }

    # Check validity of italian VAT Code
    # 
    # + pVAT - VAT Code
    # + return - Boolean, true if is valid
    public function checkvat(string pVAT) returns boolean|error;
};

public function piUtils.checkvat(string pVAT) returns boolean|error
{
    string tVAT = pVAT;

    string piRegEx = "\\d{11}";
    boolean|error isVAT = tVAT.matches(piRegEx);

    if (isVAT is error) {
        error err = error(PI_ERRCODE, { message: "Errore nel controllo della Partita IVA : " + tVAT });
        return err;
    } else {

        isVAT = (piChecksum(tVAT) == tVAT.substring(10, 11)) ? true : false;

        return isVAT;
    }
}
