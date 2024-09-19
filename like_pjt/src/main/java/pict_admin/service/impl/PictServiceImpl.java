/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package pict_admin.service.impl;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import pict_admin.service.AdminVO;
import pict_admin.service.PictDefaultVO;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("pictService")
public class PictServiceImpl extends EgovAbstractServiceImpl implements PictService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PictServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "pictDAO")
//	private PictDAO pictDAO;
	// TODO mybatis 사용
    @Resource(name="pictMapper")
	private PictMapper pictMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;


	@Override
	public List<PictVO> api_get_badge(PictVO pictVO) throws Exception {
		return pictMapper.api_get_badge(pictVO);
	}

	@Override
	public List<PictVO> api_get_coin(PictVO pictVO) throws Exception {
		return pictMapper.api_get_coin(pictVO);
	}

	@Override
	public PictVO api_get_avata(PictVO pictVO) throws Exception {
		return pictMapper.api_get_avata(pictVO);
	}

	@Override
	public void insert_avata(PictVO pictVO) throws Exception {
		pictMapper.insert_avata(pictVO);
		
	}

	@Override
	public void update_avata(PictVO pictVO) throws Exception {
		pictMapper.update_avata(pictVO);
		
	}

	@Override
	public List<?> lecture_list(PictVO pictVO) throws Exception {
		return pictMapper.lecture_list(pictVO);
	}

	@Override
	public PictVO lecture_select_one(PictVO pictVO) throws Exception {
		return pictMapper.lecture_select_one(pictVO);
	}

	@Override
	public void lecture_update(PictVO pictVO) throws Exception {
		pictMapper.lecture_update(pictVO);
		
	}

	@Override
	public void lecture_insert(PictVO pictVO) throws Exception {
		pictMapper.lecture_insert(pictVO);
		
	}

	@Override
	public List<?> lecture_attendance(PictVO pictVO) throws Exception {
		return pictMapper.lecture_attendance(pictVO);
	}
	
	@Override
	public void attendance_save(PictVO pictVO) throws Exception {
		pictMapper.attendance_save(pictVO);
	}

	@Override
	public PictVO select_attendance(PictVO pictVO) throws Exception {
		return pictMapper.select_attendance(pictVO);
	}

	@Override
	public List<PictVO> api_lecture_list(PictVO pictVO) throws Exception {
		return pictMapper.api_lecture_list(pictVO);
	}

	@Override
	public List<?> lecture_category_list(PictVO pictVO) throws Exception {
		return pictMapper.lecture_category_list(pictVO);
	}

	@Override
	public PictVO lecture_cate_select_one(PictVO pictVO) throws Exception {
		return pictMapper.lecture_cate_select_one(pictVO);
	}

	@Override
	public void lecture_cate_update(PictVO pictVO) throws Exception {
		pictMapper.lecture_cate_update(pictVO);
		
	}

	@Override
	public void lecture_cate_insert(PictVO pictVO) throws Exception {
		pictMapper.lecture_cate_insert(pictVO);
		
	}

	@Override
	public List<?> connection_user(PictVO pictVO) throws Exception {
		return pictMapper.connection_user(pictVO);
	}

	@Override
	public PictVO attendance_select_one(PictVO pictVO) throws Exception {
		return pictMapper.attendance_select_one(pictVO);
	}

	@Override
	public void attendance_save_update(PictVO vo) throws Exception {
		pictMapper.attendance_save_update(vo);
		
	}

	@Override
	public void connection_user_del(PictVO pictVO) throws Exception {
		pictMapper.connection_user_del(pictVO);
		
	}

	@Override
	public List<?> board_list(PictVO pictVO) throws Exception {
		return pictMapper.board_list(pictVO);
	}

	@Override
	public PictVO board_list_one(PictVO pictVO) throws Exception {
		return pictMapper.board_list_one(pictVO);
	}

	@Override
	public void board_update(PictVO pictVO) throws Exception {
		pictMapper.board_update(pictVO);
		
	}

	@Override
	public void board_insert(PictVO pictVO) throws Exception {
		pictMapper.board_insert(pictVO);
		
	}

	@Override
	public List<?> lecture_userinfo_list(PictVO pictVO) throws Exception {
		return pictMapper.lecture_userinfo_list(pictVO);
	}

	@Override
	public List<PictVO> lecture_attendance_api(PictVO pictVO) throws Exception {
		return pictMapper.lecture_attendance_api(pictVO);
	}

	@Override
	public void board_delete(PictVO pictVO) throws Exception {
		pictMapper.board_delete(pictVO);
		
	}

//	@Override
//	public void attendance_update(PictVO pictVO) throws Exception {
//		pictMapper.attendance_update(pictVO);
//		
//	}


	
}
