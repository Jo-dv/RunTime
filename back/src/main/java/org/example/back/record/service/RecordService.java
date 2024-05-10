package org.example.back.record.service;

import lombok.RequiredArgsConstructor;
import org.example.back.db.entity.Member;
import org.example.back.db.entity.Record;
import org.example.back.db.enums.GameMode;
import org.example.back.db.enums.StatisticType;
import org.example.back.db.repository.MemberRepository;
import org.example.back.db.repository.RecordRepository;
import org.example.back.exception.MemberNotFoundException;
import org.example.back.exception.RecordNotFoundException;
import org.example.back.exception.StatisticBadRequestException;
import org.example.back.record.dto.*;
import org.example.back.util.EnumUtils;
import org.example.back.util.SecurityUtil;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RecordService {
    private final MemberRepository memberRepository;
    private final RecordRepository recordRepository;

    @Transactional(readOnly = true)
    public RecordListResponseDto getAllRecords(Long lastId, Integer pageSize, String gameModeStr) {
        Member member = getMember();

        // String으로 들어온 열거값을 대소문자 구분하지 않고 찾아준다.
        GameMode gameMode = EnumUtils.getIgnoreCaseOrThrow(GameMode.class, gameModeStr);

        // Slice로 데이터들을 받아온다.
        Slice<RecordDto> recordSlice = recordRepository.findAll(lastId, pageSize, member, gameMode);

        // Slice에서 콘텐츠와 다음 페이지 여부를 분리한다.
        List<RecordDto> recordDtoList = recordSlice.getContent();
        boolean hasNextPage = recordSlice.hasNext();

        return new RecordListResponseDto(recordDtoList, hasNextPage);
    }

    @Transactional(readOnly = true)
    public RecordResponseDto getRecord(Long recordId) {
        Record record = recordRepository.findById(recordId)
                .orElseThrow(RecordNotFoundException::new);
        // 빨리 엔티티 수정하고 url dto에 매핑해야됨

        return RecordResponseDto.builder()
                .courseImgUrl(record.getCourseImgUrl())
                .recordId(record.getId())
                .runStartTime(record.getRunStartTime())
                .runEndTime(record.getRunEndTime())
                .gameMode(record.getGameMode())
                .ranking(record.getRanking())
                .distance(record.getDistance())
                .averagePace(record.getPace())
                .calorie(record.getCalorie())
                .build();
    }

    @Transactional(readOnly = true)
    public StatisticResponseDto getStatistic(String typeStr, LocalDate selectedDate) {
        Member member = getMember();


        // enum type 조회
        StatisticType type = EnumUtils.getIgnoreCaseOrThrow(StatisticType.class, typeStr);

        StatisticDto statisticDto;
        return switch (type) {
            case MONTH -> {
                if (selectedDate == null) throw new StatisticBadRequestException();
                statisticDto = recordRepository.getStatisticByMonth(member, selectedDate);
                yield StatisticResponseDto.builder()
                        .type(type)
                        .countDay(statisticDto.getCountDay())
                        .calorie(statisticDto.getCalorie())
                        .distance(statisticDto.getDistance())
                        .duration(statisticDto.getDuration())
                        .build();
            }
            case YEAR -> {
                if (selectedDate == null) throw new StatisticBadRequestException();
                statisticDto = recordRepository.getStatisticByYear(member, selectedDate);
                yield StatisticResponseDto.builder()
                        .type(type)
                        .countDay(statisticDto.getCountDay())
                        .calorie(statisticDto.getCalorie())
                        .distance(statisticDto.getDistance())
                        .duration(statisticDto.getDuration())
                        .build();
            }
            case ALL -> {
                statisticDto = recordRepository.getStatisticByAll(member);
                yield StatisticResponseDto.builder()
                        .type(type)
                        .countDay(statisticDto.getCountDay())
                        .calorie(statisticDto.getCalorie())
                        .distance(statisticDto.getDistance())
                        .duration(statisticDto.getDuration())
                        .build();
            }
            default -> null;
        };

    }

    // 함수로 빼봤는데, 별로인거 같아요.. 가독성이 매우 떨어짐
//    StatisticsResponseDto statisticsDtoToResponseDtoWithType(StatisticsDto from, StatisticsResponseDto to, StatisticsType type) {
//        return StatisticsResponseDto.builder()
//                .type(type)
//                .countDay(from.getCountDay())
//                .calorie(from.getCalorie())
//                .distance(from.getDistance())
//                .duration(from.getDuration())
//                .build();
//    }

    private Member getMember() {
        return memberRepository.findById(SecurityUtil.getCurrentMemberId())
                .orElseThrow(MemberNotFoundException::new);
    }

}
