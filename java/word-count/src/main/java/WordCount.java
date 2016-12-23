import java.util.HashMap;

public class WordCount {

    public HashMap<String, Integer> phrase (String phrase){

        HashMap<String, Integer> wordMap = new HashMap<String, Integer>();

        String[] words = phrase.split("\\W+");
        for (String word : words) {
            word = word.toLowerCase();
            if (wordMap.putIfAbsent(word, 1) != null) {
                wordMap.replace(word, wordMap.get(word) + 1);
            }
        }
        return wordMap;
    }
}
