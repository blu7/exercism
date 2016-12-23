import java.util.HashMap;
import java.util.Map;

public class DNA {

    private String dna;
    private static final String NUCLEOTIDES = "ATGC";

    public DNA (String dna) {
        this.dna = dna;
    }

    public int count (char nucleotide) {

        if (this.NUCLEOTIDES.indexOf(nucleotide) < 0) {
            throw new IllegalArgumentException();
        }

        int count = 0;
        for (char c : this.dna.toCharArray()) {
            count = c == nucleotide ? count + 1 : count;
        }
        return count;
    }

    public Map<Character, Integer> nucleotideCounts() {
        Map<Character, Integer> map = new HashMap<Character, Integer>();
        for (char n : this.NUCLEOTIDES.toCharArray()) {
            map.put(n, count(n));
        }
        return map;
    }
}
