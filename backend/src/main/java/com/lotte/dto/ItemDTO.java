package com.lotte.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemDTO {
    private int item_code;
    private String item_section;
    private String item_title;
    private String item_image;
    private String item_content;
    private String item_writer;
    private String item_date;
    private int item_price;
    private int item_zzim;
    private int item_like;
}


