package addPet;
import com.intuit.karate.junit5.Karate;

public class testRuner {

        @Karate.Test
        Karate APItest() {return Karate.run("adPet").relativeTo(getClass());
        }


    }

