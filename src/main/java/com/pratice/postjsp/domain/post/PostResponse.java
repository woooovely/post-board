package com.pratice.postjsp.domain.post;

import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class PostResponse {
    private Long id;
    private String title;
    private String content;
    private String writer;
    private int viewCnt;                   // 조회 수
    private Boolean noticeYn;              // 공지글 여부
    private Boolean deleteYn;              // 삭제 여부
    private LocalDateTime createdDate;     // 생성일시
    private LocalDateTime modifiedDate;    // 최종 수정일시
}
