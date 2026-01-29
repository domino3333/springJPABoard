package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.board.SpringJpaBoardApplication;
import com.board.domain.Board;
import com.board.repository.BoardRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

    private final SpringJpaBoardApplication springJpaBoardApplication;

	@Autowired
	private BoardRepository boardRepository;

    BoardServiceImpl(SpringJpaBoardApplication springJpaBoardApplication) {
        this.springJpaBoardApplication = springJpaBoardApplication;
    }

	@Override
	@Transactional
	public int register(Board b) throws Exception {
		//저장하는데 왜 보드를 주지
		Board board = boardRepository.save(b);
		return board !=null ? 1:0;
	}

	@Override
	@Transactional(readOnly=true)
	public Board read(Board b) throws Exception {
		return boardRepository.getReferenceById(b.getNo());
	}

	@Override
	@Transactional
	public int modify(Board b) throws Exception {
		//Board board는 테이블에서 가져오는 한 행을 의미함
		Board board = boardRepository.getReferenceById(b.getNo());
		//여기부터 업데이트 쿼리
		board.setContent(b.getContent());
		board.setTitle(b.getTitle());
		board.setWriter(b.getWriter());
		return board!=null? 1:0;
	}

	@Override
	@Transactional
	public int remove(Board board) throws Exception {
		int count = 1;
		try {
			boardRepository.deleteById(board.getNo());
		}catch(Exception e) {
			log.info(e.toString());
			count = 0;
		}
		
		return count;
	}

	@Override
	public List<Board> list() throws Exception {
		List<Board> boardList = boardRepository.findAll(Sort.by(Direction.DESC, "no"));
		return boardList;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Board> search(String searchType,String keyword) throws Exception {
		//searchType ={content,writer,title}
		if(searchType.equals("content")) {
			return BoardRepository.findByContentContaining(keyword);
		}else if(searchType.equals("writer")) {
			return BoardRepository.findByWriterContaining(keyword);
		}else {
			return BoardRepository.findByTitleContaining(keyword);
		}
	}
}
