package org.example.back.result.controller;

import org.example.back.result.dto.ResultResDto;
import org.example.back.result.dto.TierResDto;
import org.example.back.result.service.ResultService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/results")
public class ResultController {

	private final ResultService resultService;

	@GetMapping
	public ResultResDto getResult() {
		return resultService.getResult();
	}

	@PatchMapping("/scores")
	public ResponseEntity<TierResDto> updateScore() {
		return ResponseEntity.ok(resultService.updateScore());
	}
}
