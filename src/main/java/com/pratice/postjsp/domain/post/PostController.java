package com.pratice.postjsp.domain.post;

import com.pratice.postjsp.dto.SearchDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController // 프론트엔드와 연동하기 위해 RESTful API 사용
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class PostController {
    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/post/list")
    public List<PostResponse> getAllPosts(@ModelAttribute("params") final SearchDto params) {
        List<PostResponse> posts = postService.findAllPost(params);
        return posts;
    }

    @GetMapping("/post/list/{id}")
    public ResponseEntity<PostResponse> getPostById(@PathVariable Long id) {
        PostResponse post = postService.findPostById(id);
        if (post != null) {
            return ResponseEntity.ok(post);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/post/new")
    public ResponseEntity<Void> createPost(@RequestBody PostRequest params) {
        postService.savePost(params);
        System.out.println(params);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }
}
