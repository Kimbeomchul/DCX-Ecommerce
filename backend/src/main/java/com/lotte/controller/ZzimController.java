package com.lotte.controller;

import com.lotte.dto.ItemDTO;
import com.lotte.dto.ZzimDTO;
import com.lotte.service.ItemService;
import com.lotte.service.ZzimService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/zzim")
public class ZzimController {

    private final ZzimService zzimService;

    // 찜 내역 조회 ( 아이디로 )
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public List<ZzimDTO> getAllZzim(@RequestParam(value="member_id") String member_id) {
        return zzimService.getAllZzim(member_id);
    }

    // 찜 아이템 추가
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/item", method = RequestMethod.POST)
    public void addZzim(@RequestParam(value="member_id") String member_id,@RequestParam(value="item_code") int item_code) {
        zzimService.addZzim(member_id, item_code);
    }

    // 찜 아이템 삭제
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/item", method = RequestMethod.DELETE)
    public void delZzim(@RequestParam(value="member_id") String member_id,@RequestParam(value="item_code") int item_code) {
        zzimService.delZzim(member_id, item_code);
    }

    // 찜 카운트
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @RequestMapping(value = "/count", method = RequestMethod.GET)
    public int zzimCount(@RequestParam(value="item_code") int item_code) {
        return zzimService.zzimCount(item_code);
    }



}
