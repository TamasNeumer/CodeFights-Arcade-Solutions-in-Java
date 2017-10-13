package Arcade_Intro;

public class _2_centuryFromYear {
    int centuryFromYear(int year) {
        return (year % 100 == 0) ? year / 100 : year /100 +1;
    }
}
