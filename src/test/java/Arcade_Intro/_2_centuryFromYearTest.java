package Arcade_Intro;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class _2_centuryFromYearTest {
    private final _2_centuryFromYear testObj = new _2_centuryFromYear();

    @Test
    void centuryFromYear() {
        assertEquals(testObj.centuryFromYear(1905), 20);
        assertEquals(testObj.centuryFromYear(1701), 17);
        assertEquals(testObj.centuryFromYear(1700), 16);
        assertEquals(testObj.centuryFromYear(1800), 17);
    }
}