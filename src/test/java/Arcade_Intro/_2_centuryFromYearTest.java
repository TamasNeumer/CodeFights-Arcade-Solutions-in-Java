package Arcade_Intro;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class _2_centuryFromYearTest {
    private final _2_centuryFromYear testObj = new _2_centuryFromYear();

    @Test
    void centuryFromYear() {
        assertEquals(testObj.centuryFromYear(1905), 20);
        assertEquals(testObj.centuryFromYear(1988), 20);
        assertEquals(testObj.centuryFromYear(1700), 17);
        assertEquals(testObj.centuryFromYear(2000), 20);
        assertEquals(testObj.centuryFromYear(2001), 21);
        assertEquals(testObj.centuryFromYear(200), 2);
        assertEquals(testObj.centuryFromYear(374), 4);
    }
}