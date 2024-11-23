package com.fabian.photos;

import com.intuit.karate.junit5.Karate;

public class PhotoRunner {
/* mvn clean test -Dtest=PhotoRunner*/
    @Karate.Test
    Karate searchPhoto() {
        return Karate.run("search_photo").relativeTo(getClass());

    }
}
