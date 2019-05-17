import com.jalinyiel.ssmDemo.dao.DepartmentMapper;
import com.jalinyiel.ssmDemo.dao.EmployeeMapper;
import com.jalinyiel.ssmDemo.domain.Department;
import com.jalinyiel.ssmDemo.domain.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/** 开启Spring 单元测试
 *
 */
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void test() {
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class);
        //测试是否成功自动注入
        System.out.println(departmentMapper);
        //测试部门插入
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"财务部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
        //测试单个员工插入
//        employeeMapper.insertSelective(new Employee(null,"Alan","M","Alan@163.com",1));
        //批量插入员工
        //需要用batch模式的sqlSession会话获取的mapper插入才是批量插入，直接用for循环进行插入并不是批量插入
        EmployeeMapper batchEmpMapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i = 0; i < 100; i++ ) {
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            batchEmpMapper.insertSelective(new Employee(null,uid,"M",uid + "@163.com",1));
        }
    }
}
