package com.lotte.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
    private String member_id;
    private String member_pw;
    private String member_name;
    private String member_phone;
    private String member_address;
    private String member_level;
    private String member_regdate;
    private int member_savemoney;

}


