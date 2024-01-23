package com.yarm.demojwt.module.Greeting;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class GreetingController {

    @GetMapping()
    public String index() {
     return "Hello welcome to API";
    }

}
