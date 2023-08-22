package com.pratice.postjsp.domain.post;

import com.pratice.postjsp.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    void save(PostRequest params);

    // 게시글 상세정보 조회(파라미터 id로 특정 게시글 조회)
    PostResponse findById(Long id);

    // 게시글 수정
    void update(PostRequest params);

    // 게시글 삭제
    void deleteById(Long id);

    // 게시글 목록 조회
    /**
     * 게시글 리스트 조회
     * @return 게시글 리스트
     */
    List<PostResponse> findAll(SearchDto params);

    /**
     * 게시글 수 카운팅
     * @return 게시글 수
     */
    int count(SearchDto params);
}
