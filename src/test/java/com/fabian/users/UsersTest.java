package com.fabian.users;

import com.intuit.karate.junit5.Karate;

public class UsersTest {

    @Karate.Test
    Karate testUsers() {
//        return Karate.run("classpath:features/users.feature");
        return Karate.run("users").relativeTo(getClass());

    }
}
