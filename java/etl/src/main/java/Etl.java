import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Etl {
   public Map<String, Integer> transform(Map<Integer, List<String>> old) {

      Map<String, Integer> map = new HashMap<String, Integer>();

      for (Map.Entry<Integer, List<String>> e : old.entrySet()) {
         Integer score = e.getKey();
         List<String> letters = e.getValue();

         for (String l : letters) {
            map.put(l.toLowerCase(), score);
         }
      }
      return map;
   }
}
