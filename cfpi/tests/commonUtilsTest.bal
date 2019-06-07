import ballerina/test;
import ballerina/io;

@test:Config
function testCFChecksumCalculator() {
    string chk = cfChecksum("GRNFBA71S21F205I");
    string expected = "I";
    test:assertEquals(chk, expected, msg = "Bad CF Checksum !");
}


@test:Config
function testPIChecksumCalculator() {
    string chk = piChecksum("07643520567");
    string expected = "7";
    test:assertEquals(chk, expected, msg = "Bad PI Checksum !");

    chk = piChecksum("02319940017");
    expected = "7";
    test:assertEquals(chk, expected, msg = "Bad PI Checksum !");
}
