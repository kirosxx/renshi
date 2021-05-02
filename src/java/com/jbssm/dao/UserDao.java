package com.jbssm.dao;

import com.jbssm.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao {

    @Select("  select * from user where username = #{username} AND password = #{password} ")
    public User login(User user);

    @Select(" select * from user ")
    public List<User> findAllUser();

    @Insert(" insert into user values(null,#{username},#{password},#{post}) ")
    public void addUser(User user);

    @Delete(" delete from user where id = #{id} ")
    public void deleteUser(int id);

    @Update(" update user set username=#{username},password=#{password},post=#{post} where id = #{id} ")
    public void updateUser(User user);

    @Insert(" insert into user values(null,#{username},#{password},'员工') ")
    public void register(User user);

    @Select(" select * from user where username = #{username} ")
    public User findByName(String username);

}
