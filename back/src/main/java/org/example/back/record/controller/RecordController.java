package org.example.back.record.controller;

import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.example.back.record.dto.RecordListResponseDto;
import org.example.back.record.dto.RecordResponseDto;
import org.example.back.record.dto.StatisticsResponseDto;
import org.example.back.record.service.RecordService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/records")
public class RecordController {
    private final RecordService recordService;


    // 기록 조회
    @GetMapping("")
    public ResponseEntity<RecordListResponseDto> getAllRecords(
            @RequestParam(value = "lastId",required = false) Long lastId,
            @RequestParam("pageSize") Integer pageSize
    ) {
        RecordListResponseDto recordListResponseDto = recordService.getAllRecords(lastId, pageSize);
        return ResponseEntity.ok(recordListResponseDto);
    }

    // 기록 상세 조회
    @GetMapping("/{recordId}")
    public ResponseEntity<RecordResponseDto> getRecord(@PathVariable Long recordId) {
        RecordResponseDto recordResponseDto = recordService.getRecord(recordId);
        return ResponseEntity.ok(recordResponseDto);
    }

    // 통계 조회
    @GetMapping("/statistics/{year}/{month}")
    public ResponseEntity<StatisticsResponseDto> getStatistics(
            @PathVariable int year,
            @PathVariable int month
    ) {
        StatisticsResponseDto statisticsResponseDto = recordService.getStatistics(year, month);
        return ResponseEntity.ok(statisticsResponseDto);
    }

}
