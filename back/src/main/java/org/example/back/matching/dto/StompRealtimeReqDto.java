package org.example.back.matching.dto;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class StompRealtimeReqDto {
    private Long memberId;
    private double lon; // 경도
    private double lat; // 위도
    private double distance; // 총 이동거리
    private int index;
}
