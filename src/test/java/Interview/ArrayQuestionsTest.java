package Interview;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ArrayQuestionsTest {
    @Test
    void firstDuplicate() {
        ArrayQuestions obj = new ArrayQuestions();
        assertEquals(3, obj.firstDuplicate(new int[]{1}));
    }
}