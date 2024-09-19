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
import pict_admin.service.PictDefaultVO;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;

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

@Service("adminService")
public class AdminServiceImple extends EgovAbstractServiceImpl implements AdminService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminServiceImple.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "pictDAO")
//	private PictDAO pictDAO;
	// TODO mybatis 사용
    @Resource(name="adminMapper")
	private AdminMapper adminMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	@Override
	public AdminVO get_user_info(AdminVO adminVO) throws Exception {
		return adminMapper.get_user_info(adminVO);
	}
	
	@Override
	public void insert_user(AdminVO adminVO) throws Exception {
		adminMapper.insert_user(adminVO);
		
	}

	@Override
	public List<?> user_list(AdminVO adminVO) throws Exception {
		return adminMapper.user_list(adminVO);
	}

	@Override
	public void user_reset(AdminVO adminVO) throws Exception {
		adminMapper.user_reset(adminVO);
		
	}
	@Override
	public void insert_login_info(AdminVO adminVO) throws Exception {
		adminMapper.insert_login_info(adminVO);
		
	}

	@Override
	public void insert_meta(AdminVO adminVO) throws Exception {
		adminMapper.insert_meta(adminVO);
		
	}

	@Override
	public void dafault_template(PictVO pictVO) throws Exception {
		adminMapper.dafault_template(pictVO);
	}

	@Override
	public AdminVO user_select_one(AdminVO adminVO) throws Exception {
		return adminMapper.user_select_one(adminVO);
	}

	@Override
	public void update_user(AdminVO adminVO) throws Exception {
		adminMapper.update_user(adminVO);
		
	}

	@Override
	public void user_delete(AdminVO adminVO) throws Exception {
		adminMapper.user_delete(adminVO);
	}
	
	
	
	
}
