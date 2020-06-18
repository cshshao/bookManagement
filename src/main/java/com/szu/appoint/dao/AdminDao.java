package com.szu.appoint.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szu.appoint.entiy.Admin;

public interface AdminDao {
	//鏍规嵁绠＄悊鍛業D楠岃瘉鐢ㄦ埛鏄惁瀛樺湪 涓嶅瓨鍦ㄥ垯杩斿洖绌哄璞�
	Admin quaryAdmin(@Param("Admin_id")long Admin_id,@Param("Admin_password")long Admin_password);
	
	//鏌ヨ鎵�鏈変功绫嶅強鍏跺墿浣欐暟閲�
	List<HashMap<String, Integer>> quaryRest();
}
