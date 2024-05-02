package org.example.back.room.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.example.back.enumclass.Status;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeSet;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostRoomResDto {
    private Long roomId; // 방의 id

    private String name; // 방의 이름

    private int capacity; // 정원

    private double distance; // 목표 거리

    private String status; // 방의 상태: 대기 중인지, 게임 진행 중인지

    private String password; // 방의 비밀번호: 비밀번호가 없는 경우는 null

}