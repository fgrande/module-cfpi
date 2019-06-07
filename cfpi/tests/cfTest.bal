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
    string _cf = "GRNFBA71S21F2052";

    boolean|error isValid = _utl.checkcf(_cf);
    test:assertEquals(isValid, false, msg = "CF is valid !");
}