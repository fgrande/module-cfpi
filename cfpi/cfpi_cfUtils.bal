// CFUtils Class

# VAT Code utilities class
public type cfUtils object {
   
    public function __init()
    {
    }

    # Check validity of italian VAT Code
    # 
    # + pCF - VAT Code
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
        return isCF;
    }
}