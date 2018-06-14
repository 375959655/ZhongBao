package com.bysj.zhongbao.dao;

import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.vo.TaskInfo;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskMapper {
	int countByExample(TaskExample example);

	int deleteByExample(TaskExample example);

	int deleteByPrimaryKey(Integer taskid);

	int insert(Task record);

	int insertSelective(Task record);

	List<Task> selectByExample(TaskExample example);
	
	List<Task> selectByUserid(Integer userid);

	Task selectByPrimaryKey(Integer taskid);

	int updateByExampleSelective(@Param("record") Task record, @Param("example") TaskExample example);

	int updateByExample(@Param("record") Task record, @Param("example") TaskExample example);

	int updateByPrimaryKeySelective(Task record);

	int updateByPrimaryKey(Task record);

	List<Task> taskInfosByType(@Param("typeid") int typeid, @Param("skip") int skip, @Param("size") int size);

	List<Task> taskInfosByText(@Param("text") String text, @Param("skip") int skip, @Param("size") int size);

	List<Task> getAlltasks(@Param("skip") int skip, @Param("size") int size, @Param("theme") String theme);

	List<Task> getNewTasks(@Param("skip") int skip, @Param("size") int size,@Param("theme") String theme);

	List<Task> getMoneyTasks(@Param("skip") int skip, @Param("size") int size,@Param("theme") String theme);

	List<TaskInfo> getAlltasksPage();
}