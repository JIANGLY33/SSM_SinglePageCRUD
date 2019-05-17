import com.github.pagehelper.PageInfo;
import com.jalinyiel.ssmDemo.domain.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//声明单元测试加载的应用上下文是WebApplicationContext
@WebAppConfiguration("src/main/resources")
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MvcTest {
    MockMvc mockMvc;
    @Autowired
    WebApplicationContext context;
    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    /**
     * 模拟发送请求，测试分页查询
     * @throws Exception
     */
    @Test
    public void testPage() throws Exception {
        MvcResult res = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pageNum","1")).andReturn();
        MockHttpServletRequest request = res.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码:" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        List<Employee> list = pageInfo.getList();
        for(Employee e : list) {
            System.out.println("员工ID：" + e.getEmpId() + "，员工姓名：" + e.getEmpName() + "，所属部门" + e.getDept().getDeptName());
        }

    }

}
