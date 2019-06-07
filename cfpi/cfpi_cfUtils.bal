import ballerina/io;
// cfUtils Class

# Fiscal Code utilities class
public type cfUtils object {
   
    public function __init()
    {
    }

    # Check validity of italian Fiscal Code
    # 
    # + pCF - Fiscal Code
    # + return - Boolean, true if is valid
    public function checkcf(string pCF) returns boolean|error;
};

public function cfUtils.checkcf(string pCF) returns boolean|error
{
    string tCF = pCF.toUpper();

    string cfRegEx = "[A-Z]{3}[A-Z]{3}\\d{2}[A-Z]\\d{2}[A-Z]\\d{3}[A-Z]";
    boolean|error isCF = tCF.matches(cfRegEx);

    if (isCF is error) {
        error err = error(CF_ERRCODE, { message: "Errore nel controllo del Codice Fiscale : " + tCF });
        return err;
    } else {

        isCF = (cfChecksum(tCF) == tCF.substring(15, 16)) ? true : false;

        return isCF;
    }
}
