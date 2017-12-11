import com.google.common.collect.Lists;
import javafx.scene.media.SubtitleTrack;

import java.util.*;

/**
 **/
public class TTT {
    public static void main(String[] args) {
        test.TestKotlin.Companion.showString();


        Map map=new HashMap<>();
        Set<Map.Entry<?,?>> entries = map.entrySet();
        for (Map.Entry<?,?> ss:entries) {
            
        }

        List<Object> list = Lists.newArrayList();
        list = Lists.newLinkedList();
        list.add("1");
        list.add("2");
        list.add("1");
        list.remove("4");
        System.out.println("list.size="+list.size());
        Set set = new HashSet();
        set.add("1");
        set.add("2");
        set.add("1");
        set.remove("4");
        System.out.println("list.size="+set.size());
    }
}
