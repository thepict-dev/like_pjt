/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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


import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.AdminVO;
import pict_admin.service.PictVO;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("adminMapper")
public interface AdminMapper {
	
	AdminVO get_user_info(AdminVO adminVO) throws Exception;

	void insert_user(AdminVO adminVO) throws Exception;

	List<?> user_list(AdminVO adminVO) throws Exception;

	void user_reset(AdminVO adminVO) throws Exception;

	void insert_login_info(AdminVO adminVO) throws Exception;

	void insert_meta(AdminVO adminVO) throws Exception;

	void dafault_template(PictVO pictVO) throws Exception;

	AdminVO user_select_one(AdminVO adminVO) throws Exception;

	void update_user(AdminVO adminVO)throws Exception;

	void user_delete(AdminVO adminVO) throws Exception;
	

}
