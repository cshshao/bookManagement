package Test_Dao;



import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


import com.szu.appoint.dao.BookDao;


import Util.BaseDAoTestClass;

public class test extends BaseDAoTestClass {
	@Autowired    //Autowired 按类型匹配
	private BookDao bookdao;
//	@Test
//	public void Test_admindao(){
//		Admin admin=admindao.quaryAdmin(151855,620081);
//		System.out.println(admin.toString());
//	}
	@Test
	public void test(){
		bookdao.addBook("从你的世界路过", 11, "文艺小说");
	}
}
