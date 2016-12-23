import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by luke on 10.10.16.
 */
public class Pangrams {

    public static boolean isPangram (String p) {
        LinkedList<Character> chars = p.toLowerCase().chars().mapToObj(i -> (char)i)
                                        .filter(x -> x >= 'a' && x <='z')
                                        .collect(Collectors.toCollection(LinkedList::new));

        for(char c = 'a'; c <= 'z'; c++) {
            if (!chars.remove(new Character(c))) {
                return false;
            }
        }
        return true;
    }

}
