import ballerina/test;
import ballerina/time;
import ballerina/system;
import ballerina/config;
import ballerina/io;

@test:Config
function testValidCF() {
    
    cfUtils _utl = new;
    string _cf = "GRNFBA71S21F205I";

    boolean|error isValid = _utl.checkcf(_cf);
    test:assertEquals(isValid, true, msg = "CF is not valid !");
}


@test:Config
function testInvalidCF() {
    
    cfUtils _utl = new;
    string _cf = "GRNFBA71S21F205X";

    boolean|error isValid = _utl.checkcf(_cf);
    test:assertEquals(isValid, false, msg = "This shoud be invalid !");
}


@test:Config
function testValidVAT() {
    
    piUtils _utl = new;
    string _vat = "02319940017";

    boolean|error isValid = _utl.checkvat(_vat);
    test:assertEquals(isValid, true, msg = "VAT is not valid !");
}

