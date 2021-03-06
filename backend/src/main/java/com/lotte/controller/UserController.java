package com.lotte.controller;
import com.lotte.dto.UserDTO;
import com.lotte.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

//     모든 User정보 불러오기
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<UserDTO> getUser() {
        return userService.getUserList();
    }


    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/count", method = RequestMethod.GET)
    public int count_user() {
        return userService.count_user();
    }


    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public List<UserDTO> searchUser(@RequestParam(value="member") String member) {
        return userService.searchUser(member);
    }


    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/info", method = RequestMethod.PUT)
    public void addPhone(@RequestParam(value="member_phone") String member_phone , @RequestParam(value="member_address") String member_address, @RequestParam(value="member_id") String member_id) {
        userService.addphone(member_phone,member_address,member_id);
    }




    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/reward", method = RequestMethod.PUT)
    public void addsave(@RequestParam(value="member_savemoney") int member_savemoney , @RequestParam(value="member_id") String member_id) {
        userService.addsave(member_savemoney ,member_id);
    }




}
