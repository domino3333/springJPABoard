package com.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.board.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{

	static List<Board> findByContentContaining(String keyword){
		return null;

	}

	static List<Board> findByWriterContaining(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	static List<Board> findByTitleContaining(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
